import 'dart:async';
import 'dart:convert';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upv_mobile/Services/service_page.dart';

class AccordionPage extends StatefulWidget {
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

  const AccordionPage({
    Key? key,
    // required this.blastData,
  }) : super(key: key);

  // final blastData;

  @override
  State<AccordionPage> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionPage> {
  // late  blastData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Accordion(
        headerBorderColor: Colors.blueGrey,
        headerBorderColorOpened: Colors.transparent,
        // headerBorderWidth: 1,
        headerBackgroundColorOpened: const Color.fromARGB(255, 55, 114, 209),
        // headerBackgroundColorOpened: Colors.green,
        contentBackgroundColor: Colors.white,
        // contentBorderColor: Colors.green,
        contentBorderWidth: 2,
        contentHorizontalPadding: 0,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            isOpen: true,
            contentVerticalPadding: 20,
            leftIcon:
                const Icon(Icons.text_fields_rounded, color: Colors.white),
            header:
                const Text('BLAST FURNACE', style: AccordionPage.headerStyle),
            content: const Col(),
          ),
          // AccordionSection(
          //   isOpen: false,
          //   leftIcon:
          //       const Icon(Icons.text_fields_rounded, color: Colors.white),
          //   header: const Text("BLAST FURNACE", style: headerStyle),
          //   content: const MyDataTable(),
          // ),
          AccordionSection(
            isOpen: false,
            leftIcon:
                const Icon(Icons.text_fields_rounded, color: Colors.white),
            header: const Text("BASIC OXYGEN FURNACE",
                style: AccordionPage.headerStyle),
            content: const MyDataTable(),
          ),
        ],
      ),
    );
  }
} //__

class Col extends StatefulWidget {
  const Col({super.key});
  @override
  State<Col> createState() {
    return ColState();
  }
}

class ColState extends State<Col> {
  late dynamic blastData;
  var loading = true;
  @override
  void initState() {
    super.initState();
    fun();
  }

  fun() {
    blastfurnacedata();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      blastfurnacedata();
    });
  }

  blastfurnacedata() async {
    var response = await blastfurnace();
    if (response.statusCode == 200) {
      setState(() {
        blastData = json.decode(response.body);
      });

      print(blastData);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: const Center(
            child: Text('Login Failed, wrong userid or password'),
          ),
          action: SnackBarAction(label: '', onPressed: () {}),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // blastfurnacedata();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Parameter",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 152, 152, 152)),
              ),
              Text("Value",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 152, 152, 152))),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Blast Volume [Nm3/min]"),
              Text(blastData["BF_COLDF"].toStringAsFixed(2)),
              // Text("Dgd"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("O2 Enrich [Nm3/hr]"),
              Text(blastData["OF"].toStringAsFixed(2)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("CDI Rate [TPH] PV/SV"),
              Text(
                  " ${blastData["CDI_INJRATE"].toStringAsFixed(2)}/${blastData["CDISP"].toString()}"),
            ],
          )
        ],
      ),
    );
  }
}

Widget _col(data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    child: Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Parameter",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 152, 152, 152)),
            ),
            Text("Value",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 152, 152, 152))),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Blast Volume [Nm3/min]"),
            Text(data["BF_COLDF"].toStringAsFixed(2)),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("O2 Enrich [Nm3/hr]"),
            Text("9966"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("CDI Rate [TPH] PV/SV"),
            Text("39.74 / 38"),
          ],
        )
      ],
    ),
  );
}

class MyDataTable extends StatelessWidget //__
{
  const MyDataTable({super.key});

  @override
  Widget build(context) //__
  {
    return DataTable(
      sortAscending: true,
      sortColumnIndex: 1,
      showBottomBorder: false,
      columns: const [
        DataColumn(
            label: Text('Parameter', style: AccordionPage.contentStyleHeader),
            numeric: true),
        // DataColumn(
        //     label:
        //         Text('Description', style: AccordionPage.contentStyleHeader)),
        DataColumn(
            label: Text('value', style: AccordionPage.contentStyleHeader),
            numeric: true),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text('Blast Volume [Nm3/min]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text('5640',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('O2 Enrich [Nm3/hr]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.left)),
            DataCell(Text(r'9966',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('CDI Rate [TPH] PV/SV',
                style: AccordionPage.contentStyle, textAlign: TextAlign.left)),
            DataCell(Text(r'39.74 / 38',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Blast Pressure [Kg/cm2]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.left)),
            DataCell(Text(r'2',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Top Pressure [Kg/cm2]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.left)),
            DataCell(Text(r'2.30',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Delta P [Kg/cm2]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.left)),
            DataCell(Text(r'1.47',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Top Temperature [DegC]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.left)),
            DataCell(Text(r'133',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Blast Temp [DegC] PV/SV',
                style: AccordionPage.contentStyle, textAlign: TextAlign.left)),
            DataCell(Text(r'1155 / 1150',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Raft [DegC]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'2093',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('ETA CO [%]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'42.46',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Heat Load[Mcal]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'14942',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Charge Count',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'36',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Charge Volume[m3]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'107',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Exp. HM/Charge[Ton]/ Cumm.',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'64 / 2320',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Last Day HM Prod [Ton]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'2893',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Curr. Day HM Prod[Ton] A/B/C',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'1902 / 0 / 0',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Silicon[%]@ Sample time',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'0.74 @ 12 : 47',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Runner#1 Hot Metal Temp [DegC]',
                style: AccordionPage.contentStyle, textAlign: TextAlign.start)),
            DataCell(Text(r'1474',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),

// Runner#2 Hot Metal Temp [DegC]	1439
// Runner#3 Hot Metal Temp [DegC]	1428
// Runner#4 Hot Metal Temp [DegC]	1512
// Flare Stack Flow [Nm3/hr]	94702
// Flare Stack Pressure [mmwc]	891
// O2 Enriched [%]	2.23
      ],
    );
  }
}
