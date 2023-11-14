import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

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
  var num = -1;

  @override
  void initState() {
    super.initState();

    fun();
  }

  Color _containerColor = const Color.fromARGB(255, 17, 156, 43);
  Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  Color _textColor = const Color.fromARGB(255, 44, 44, 44);

  _changeColor(no) {
    setState(() {
      for (int i = 0; i < rows.length; i++) {
        rows[i]["selected"] = false;
      }
      rows[no]["selected"] = true;
      num = no;
    });
  }

  fun() {
    blastfurnacedata();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      blastfurnacedata();
    });
  }

  List<dynamic> rows = [];

  blastfurnacedata() {
    blastfurnace().then((data) {
      if (mounted) {
        setState(() {
          blastData = json.decode(data.body);
          rows = [
            {
              "head": "Blast Volume [Nm3/min]",
              "data": blastData["BF_COLDF"].toStringAsFixed(0),
              "selected": false,
              "i": 0,
            },
            {
              "head": "O2 Enrich [Nm3/hr]",
              "data": blastData["OF"].toStringAsFixed(2),
              "selected": false,
              "i": 1
            },
            {
              "head": "CDI Rate [TPH] PV/SV",
              "data":
                  "${blastData["CDI_INJRATE"].toStringAsFixed(2)}/${blastData["CDISP"].toString()}",
              "selected": false,
              "i": 2
            },
            {
              "head": "Blast Pressure [Kg/cm2]",
              "data": "${blastData["BF_COLDP"].toStringAsFixed(2)}",
              "selected": false,
              "i": 3
            },
            {
              "head": "Top Pressure [Kg/cm2]",
              "data": "${blastData["BF_TOPP"].toStringAsFixed(2)}",
              "selected": false,
              "i": 4
            },
            {
              "head": "Delta P [Kg/cm2]",
              "data": "${blastData["DELTAP"].toStringAsFixed(2)}",
              "selected": false,
              "i": 5
            },
            {
              "head": "Top Temperature [DegC]",
              "data": "${blastData["BF_TOPT"].toStringAsFixed(0)}",
              "selected": false,
              "i": 6
            },
            {
              "head": "Blast Temp [DegC] PV/SV",
              "data":
                  "${blastData["HBTAVG"].toStringAsFixed(0)}/${blastData["BTSP"].toStringAsFixed(0)}",
              "selected": false,
              "i": 7
            },
            {
              "head": "Raft [DegC]",
              "data": "${blastData["RAFT"].toStringAsFixed(0)}",
              "selected": false,
              "i": 8
            },
            {
              "head": "ETA CO [%]",
              "data": "${blastData["BF_CO"].toStringAsFixed(2)}",
              "selected": false,
              "i": 9
            },
            {
              "head": "Heat Load[Mcal]",
              "data": "${blastData["TOTAL_HEAT_LOAD"].toStringAsFixed(2)}",
              "selected": false,
              "i": 10
            },
            {
              "head": "Charge Count",
              "data": "${blastData["BF_CHARGE"].toStringAsFixed(2)}",
              "selected": false,
              "i": 11
            },
            {
              "head": "Charge Volume[m3]",
              "data": "${blastData["BURDENREPORT_CHRGVOL"]}",
              "selected": false,
              "i": 12
            },
            {
              "head": "Exp. HM/Charge[Ton]/Cumm.",
              "data":
                  "${blastData["BURDENREPORT_HM"].toStringAsFixed(0)}/${blastData["BURDENREPORT_CHARGE"].toStringAsFixed(0)}",
              "selected": false,
              "i": 13
            },
            {
              "head": "Last Day HM Prod [Ton]",
              "data": "${blastData["LADLE_BFTLMSPROD"].toStringAsFixed(2)}",
              "selected": false,
              "i": 14
            },
            {
              "head": "Curr. Day HM Prod[Ton] A/B/C",
              "data":
                  "${blastData["LADLE_BOFA"].toStringAsFixed(2)}/${blastData["LADLE_BOFB"] == null ? "0" : blastData["LADLE_BOFB"].toStringAsFixed(0)}/${blastData["LADLE_BOFC"] ?? "0"}",
              "selected": false,
              "i": 15
            },
            {
              "head": "Silicon[%]@ Sample time",
              "data":
                  "${blastData["LAB_SI"].toStringAsFixed(2)}@${blastData["LAB_HR"] ?? "0"}:${blastData["LAB_MIN"] ?? "0"}",
              "selected": false,
              "i": 16
            },
            {
              "head": "Runner#1 Hot Metal Temp [DegC]",
              "data": "${blastData["NRUNNERBF_RUNNERTEMP1"]}",
              "selected": false,
              "i": 17
            },
            {
              "head": "Runner#2 Hot Metal Temp [DegC]",
              "data": "${blastData["NRUNNERBF_RUNNERTEMP2"]}",
              "selected": false,
              "i": 18
            },
            {
              "head": "Runner#3 Hot Metal Temp [DegC]",
              "data": "${blastData["NRUNNERBF_RUNNERTEMP3"]}",
              "selected": false,
              "i": 19
            },
            {
              "head": "Runner#4 Hot Metal Temp [DegC]",
              "data": "${blastData["NRUNNERBF_RUNNERTEMP4"]}",
              "selected": false,
              "i": 20
            },
            {
              "head": "Flare Stack Flow [Nm3/hr]",
              "data": "${blastData["BF_FLAREF"].toStringAsFixed(0)}",
              "selected": false,
              "i": 21
            },
            {
              "head": "Flare Stack Pressure [mmwc]",
              "data": "${blastData["BF_FLAREP"].toStringAsFixed(0)}",
              "selected": false,
              "i": 22
            },
            {
              "head": "O2 Enriched [%]",
              "data": "${blastData["O2PER"].toStringAsFixed(2)}",
              "selected": false,
              "i": 23
            },
          ];
          if (num != -1) {
            rows[num]["selected"] = true;
          }
          loading = false;
        });
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
    });
    // var response = await blastfurnace();
    // if (response.statusCode == 200) {
    //   setState(() {
    //     blastData = json.decode(response.body);

    //     rows = [
    //       {
    //         "head": "Blast Volume [Nm3/min]",
    //         "data": blastData["BF_COLDF"].toStringAsFixed(0),
    //         "selected": false,
    //         "i": 0,
    //       },
    //       {
    //         "head": "O2 Enrich [Nm3/hr]",
    //         "data": blastData["OF"].toStringAsFixed(2),
    //         "selected": false,
    //         "i": 1
    //       },
    //       {
    //         "head": "CDI Rate [TPH] PV/SV",
    //         "data":
    //             "${blastData["CDI_INJRATE"].toStringAsFixed(2)}/${blastData["CDISP"].toString()}",
    //         "selected": false,
    //         "i": 2
    //       },
    //       {
    //         "head": "Blast Pressure [Kg/cm2]",
    //         "data": "${blastData["BF_COLDP"].toStringAsFixed(2)}",
    //         "selected": false,
    //         "i": 3
    //       },
    //       {
    //         "head": "Top Pressure [Kg/cm2]",
    //         "data": "${blastData["BF_TOPP"].toStringAsFixed(2)}",
    //         "selected": false,
    //         "i": 4
    //       },
    //       {
    //         "head": "Delta P [Kg/cm2]",
    //         "data": "${blastData["DELTAP"].toStringAsFixed(2)}",
    //         "selected": false,
    //         "i": 5
    //       },
    //       {
    //         "head": "Top Temperature [DegC]",
    //         "data": "${blastData["BF_TOPT"].toStringAsFixed(0)}",
    //         "selected": false,
    //         "i": 6
    //       },
    //       {
    //         "head": "Blast Temp [DegC] PV/SV",
    //         "data":
    //             "${blastData["HBTAVG"].toStringAsFixed(0)}/${blastData["BTSP"].toStringAsFixed(0)}",
    //         "selected": false,
    //         "i": 7
    //       },
    //       {
    //         "head": "Raft [DegC]",
    //         "data": "${blastData["RAFT"].toStringAsFixed(0)}",
    //         "selected": false,
    //         "i": 8
    //       },
    //       {
    //         "head": "ETA CO [%]",
    //         "data": "${blastData["BF_CO"].toStringAsFixed(2)}",
    //         "selected": false,
    //         "i": 9
    //       },
    //       {
    //         "head": "Heat Load[Mcal]",
    //         "data": "${blastData["TOTAL_HEAT_LOAD"].toStringAsFixed(2)}",
    //         "selected": false,
    //         "i": 10
    //       },
    //       {
    //         "head": "Charge Count",
    //         "data": "${blastData["BF_CHARGE"].toStringAsFixed(2)}",
    //         "selected": false,
    //         "i": 11
    //       },
    //       {
    //         "head": "Charge Volume[m3]",
    //         "data": "${blastData["BURDENREPORT_CHRGVOL"]}",
    //         "selected": false,
    //         "i": 12
    //       },
    //       {
    //         "head": "Exp. HM/Charge[Ton]/Cumm.",
    //         "data":
    //             "${blastData["BURDENREPORT_HM"].toStringAsFixed(0)}/${blastData["BURDENREPORT_CHARGE"].toStringAsFixed(0)}",
    //         "selected": false,
    //         "i": 13
    //       },
    //       {
    //         "head": "Last Day HM Prod [Ton]",
    //         "data": "${blastData["LADLE_BFTLMSPROD"].toStringAsFixed(2)}",
    //         "selected": false,
    //         "i": 14
    //       },
    //       {
    //         "head": "Curr. Day HM Prod[Ton] A/B/C",
    //         "data":
    //             "${blastData["LADLE_BOFA"].toStringAsFixed(2)}/${blastData["LADLE_BOFB"].toStringAsFixed(0) ?? "0"}/${blastData["LADLE_BOFC"] ?? "0"}",
    //         "selected": false,
    //         "i": 15
    //       },
    //       {
    //         "head": "Silicon[%]@ Sample time",
    //         "data":
    //             "${blastData["LAB_SI"].toStringAsFixed(2)}@${blastData["LAB_HR"] ?? "0"}:${blastData["LAB_MIN"] ?? "0"}",
    //         "selected": false,
    //         "i": 16
    //       },
    //       {
    //         "head": "Runner#1 Hot Metal Temp [DegC]",
    //         "data": "${blastData["NRUNNERBF_RUNNERTEMP1"]}",
    //         "selected": false,
    //         "i": 17
    //       },
    //       {
    //         "head": "Runner#2 Hot Metal Temp [DegC]",
    //         "data": "${blastData["NRUNNERBF_RUNNERTEMP2"]}",
    //         "selected": false,
    //         "i": 18
    //       },
    //       {
    //         "head": "Runner#3 Hot Metal Temp [DegC]",
    //         "data": "${blastData["NRUNNERBF_RUNNERTEMP3"]}",
    //         "selected": false,
    //         "i": 19
    //       },
    //       {
    //         "head": "Runner#4 Hot Metal Temp [DegC]",
    //         "data": "${blastData["NRUNNERBF_RUNNERTEMP4"]}",
    //         "selected": false,
    //         "i": 20
    //       },
    //       {
    //         "head": "Flare Stack Flow [Nm3/hr]",
    //         "data": "${blastData["BF_FLAREF"].toStringAsFixed(0)}",
    //         "selected": false,
    //         "i": 21
    //       },
    //       {
    //         "head": "Flare Stack Pressure [mmwc]",
    //         "data": "${blastData["BF_FLAREP"].toStringAsFixed(0)}",
    //         "selected": false,
    //         "i": 22
    //       },
    //       {
    //         "head": "O2 Enriched [%]",
    //         "data": "${blastData["O2PER"].toStringAsFixed(2)}",
    //         "selected": false,
    //         "i": 23
    //       },
    //     ];
    //     if (num != -1) {
    //       rows[num]["selected"] = true;
    //     }
    //     loading = false;
    //   });

    //   // print(blastData);
    // } else {
    //   // ignore: use_build_context_synchronously
    //   ScaffoldMessenger.of(context).clearSnackBars();
    //   // ignore: use_build_context_synchronously
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       duration: const Duration(seconds: 3),
    //       content: const Center(
    //         child: Text('Login Failed, wrong userid or password'),
    //       ),
    //       action: SnackBarAction(label: '', onPressed: () {}),
    //     ),
    //   );
    // }
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
                      color: Color.fromARGB(113, 44, 129, 227), // Border color
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
                for (final Map r in rows)
                  GestureDetector(
                    onTap: () {
                      _changeColor(r["i"]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: r["selected"] == true
                            ? _containerColor
                            : _containerColora,
                        border: Border.all(
                          color:
                              Color.fromARGB(113, 44, 129, 227), // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 0),
                      child: _row(
                          r["head"],
                          r["data"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 8,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Color.fromARGB(113, 44, 129, 227),
                width: 2.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              h,
              style: TextStyle(color: color),
            ),
          ),
        ),
      ),
      i == 5
          ? Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    color: double.parse(d) >= 1.6 && double.parse(d) <= 1.65
                        ? Colors.amber
                        : Color.fromARGB(255, 255, 64, 64)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    d,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            )
          : Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(),
                child: Text(
                  d,
                  style: TextStyle(color: color),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
    ],
  );
}
