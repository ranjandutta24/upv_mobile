import 'dart:async';
import 'dart:convert';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Widgets/ex3.dart';

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
            leftIcon: const Icon(Icons.bolt_sharp, color: Colors.white),
            header:
                const Text('BLAST FURNACE', style: AccordionPage.headerStyle),
            content: const Col(),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon:
                const Icon(Icons.text_fields_rounded, color: Colors.white),
            header: const Text("BASIC OXYGEN FURNACE",
                style: AccordionPage.headerStyle),
            content: DataTableExample(),
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
    // setState(() {
    //   loading = true;
    // });
    var response = await blastfurnace();
    if (response.statusCode == 200) {
      setState(() {
        blastData = json.decode(response.body);
        loading = false;
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
      child: loading
          ? const Text("")
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 109, 109, 109), // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  child: const Row(
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
                ),
                _row(
                  "Blast Volume [Nm3/min]",
                  blastData["BF_COLDF"].toStringAsFixed(0),
                ),
                _row(
                  "O2 Enrich [Nm3/hr]",
                  blastData["OF"].toStringAsFixed(2),
                ),
                _row(
                  "CDI Rate [TPH] PV/SV",
                  "${blastData["CDI_INJRATE"].toStringAsFixed(2)}/${blastData["CDISP"].toString()}",
                ),
                _row(
                  "Blast Pressure [Kg/cm2]",
                  "${blastData["BF_COLDP"].toStringAsFixed(2)}",
                ),
                _row(
                  "Top Pressure [Kg/cm2]",
                  "${blastData["BF_TOPP"].toStringAsFixed(2)}",
                ),
                _row(
                  "Delta P [Kg/cm2]",
                  "${blastData["DELTAP"].toStringAsFixed(2)}",
                ),
                _row(
                  "Top Temperature [DegC]",
                  "${blastData["BF_TOPT"].toStringAsFixed(0)}",
                ),
                _row(
                  "Blast Temp [DegC] PV/SV",
                  "${blastData["HBTAVG"].toStringAsFixed(0)}/${blastData["BTSP"].toStringAsFixed(0)}",
                ),
                _row(
                  "Raft [DegC]",
                  "${blastData["RAFT"].toStringAsFixed(0)}",
                ),
                _row(
                  "ETA CO [%]",
                  "${blastData["BF_CO"].toStringAsFixed(2)}",
                ),
                _row(
                  "Heat Load[Mcal]",
                  "${blastData["TOTAL_HEAT_LOAD"].toStringAsFixed(2)}",
                ),
                _row(
                  "Charge Count",
                  "${blastData["BF_CHARGE"].toStringAsFixed(2)}",
                ),
                _row(
                  "Charge Volume[m3]",
                  "${blastData["BURDENREPORT_CHRGVOL"]}",
                ),
                _row(
                  "Exp. HM/Charge[Ton]/Cumm.",
                  "${blastData["BURDENREPORT_HM"].toStringAsFixed(0)}/${blastData["BURDENREPORT_CHARGE"].toStringAsFixed(0)}",
                ),
                _row(
                  "Last Day HM Prod [Ton]",
                  "${blastData["LADLE_BFTLMSPROD"].toStringAsFixed(2)}",
                ),
                _row(
                  "Curr. Day HM Prod[Ton] A/B/C",
                  "${blastData["LADLE_BOFA"].toStringAsFixed(2)}/${blastData["LADLE_BOFB"] ?? "0"}/${blastData["LADLE_BOFC"] ?? "0"}",
                ),
                _row(
                  "Silicon[%]@ Sample time",
                  "${blastData["LAB_SI"].toStringAsFixed(2)}@${blastData["LAB_HR"] ?? "0"}:${blastData["LAB_MIN"] ?? "0"}",
                ),
                _row(
                  "Runner#1 Hot Metal Temp [DegC]",
                  "${blastData["NRUNNERBF_RUNNERTEMP1"]}",
                ),
                _row(
                  "Runner#2 Hot Metal Temp [DegC]",
                  "${blastData["NRUNNERBF_RUNNERTEMP2"]}",
                ),
                _row(
                  "Runner#3 Hot Metal Temp [DegC]",
                  "${blastData["NRUNNERBF_RUNNERTEMP3"]}",
                ),
                _row(
                  "Runner#4 Hot Metal Temp [DegC]",
                  "${blastData["NRUNNERBF_RUNNERTEMP4"]}",
                ),
                _row(
                  "Flare Stack Flow [Nm3/hr]",
                  "${blastData["BF_FLAREF"].toStringAsFixed(0)}",
                ),
                _row(
                  "Flare Stack Pressure [mmwc]",
                  "${blastData["BF_FLAREP"].toStringAsFixed(0)}",
                ),
                _row(
                  "O2 Enriched [%]",
                  "${blastData["O2PER"].toStringAsFixed(2)}",
                ),
              ],
            ),
    );
  }
}

Widget _row(
  h,
  d,
) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          border: Border.all(
            color: const Color.fromARGB(255, 165, 165, 165), // Border color
            width: 1.0, // Border width
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(h, style: TextStyle(color: Color.fromARGB(255, 57, 57, 57))),
            Text(d),
          ],
        )),
  );
}

class _Row extends StatefulWidget {
  const _Row({super.key});
  @override
  State<_Row> createState() {
    return _RowState();
  }
}

class _RowState extends State<_Row> {
  Color _containerColor = Colors.blue; // Initial background color

  void _changeColor() {
    setState(() {
      // Change the background color to a different color when pressed
      _containerColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeColor,
      child: Container(
          decoration: BoxDecoration(
            color: _containerColor,
            border: Border.all(
              color: const Color.fromARGB(255, 165, 165, 165), // Border color
              width: 1.0, // Border width
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("h",
                  style: TextStyle(color: Color.fromARGB(255, 57, 57, 57))),
              Text("d"),
            ],
          )),
    );
  }
}
