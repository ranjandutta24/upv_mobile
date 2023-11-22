import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Bfi extends StatefulWidget {
  const Bfi({super.key});

  @override
  State<Bfi> createState() {
    return BfiState();
  }
}

class BfiState extends State<Bfi> {
  late dynamic bfiData;
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
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      blastfurnacedata();
    });
  }

  List<dynamic> rows = [];

  blastfurnacedata() {
    if (mounted) {
      blastfurnace().then((data) {
        if (data != null) {
          setState(() {
            bfiData = json.decode(data.body);
            rows = [
              {
                "head": "Blast Volume [Nm3/min]",
                "data": bfiData["BF_COLDF"].toStringAsFixed(0),
                "selected": false,
                "i": 0,
              },
              {
                "head": "Blast Pressure [Kg/cm2]",
                "data": "${bfiData["BF_COLDP"].toStringAsFixed(2)}",
                "selected": false,
                "i": 1
              },
              {
                "head": "Top Pressure [Kg/cm2]",
                "data": "${bfiData["BF_TOPP"].toStringAsFixed(2)}",
                "selected": false,
                "i": 2
              },
              {
                "head": "Top Temperature [DegC]",
                "data": "${bfiData["BF_TOPT"].toStringAsFixed(0)}",
                "selected": false,
                "i": 3
              },
              {
                "head": "Blast Temp [DegC] PV/SV",
                "data":
                    "${bfiData["HBTAVG"].toStringAsFixed(0)}/${bfiData["BTSP"].toStringAsFixed(0)}",
                "selected": false,
                "i": 4
              },
              {
                "head": "Runner#1 Hot Metal Temp [DegC]",
                "data": "${bfiData["NRUNNERBF_RUNNERTEMP1"]}",
                "selected": false,
                "i": 5
              },
              {
                "head": "Runner#2 Hot Metal Temp [DegC]",
                "data": "${bfiData["NRUNNERBF_RUNNERTEMP2"]}",
                "selected": false,
                "i": 6
              },
              {
                "head": "Runner#3 Hot Metal Temp [DegC]",
                "data": "${bfiData["NRUNNERBF_RUNNERTEMP3"]}",
                "selected": false,
                "i": 7
              },
              {
                "head": "Runner#4 Hot Metal Temp [DegC]",
                "data": "${bfiData["NRUNNERBF_RUNNERTEMP4"]}",
                "selected": false,
                "i": 8
              },
              {
                "head": "CDI [TPH]",
                "data": "${bfiData["CDI_INJRATE"].toStringAsFixed(2)}",
                "selected": false,
                "i": 9
              },
              {
                "head": "Raft [DegC]",
                "data": "${bfiData["RAFT"].toStringAsFixed(0)}",
                "selected": false,
                "i": 10
              },
              {
                "head": "O2 Enrich [Nm3/hr]",
                "data": bfiData["OF"].toStringAsFixed(2),
                "selected": false,
                "i": 11
              },
              {
                "head": "Heat Load[Mcal]",
                "data": "${bfiData["TOTAL_HEAT_LOAD"].toStringAsFixed(2)}",
                "selected": false,
                "i": 12
              },
              {
                "head": "ETA CO [%]",
                "data": "${bfiData["BF_CO"].toStringAsFixed(2)}",
                "selected": false,
                "i": 13
              },
              {
                "head": "Charge Count",
                "data": "${bfiData["BF_CHARGE"].toStringAsFixed(2)}",
                "selected": false,
                "i": 14
              },
              {
                "head": "Ore Coke Ratio",
                "data": "${bfiData["OREBYCOKE"].toStringAsFixed(2)}",
                "selected": false,
                "i": 15
              },
              {
                "head": "Production rate",
                "data": "${bfiData["PROD_RATE"].toStringAsFixed(2)}",
                "selected": false,
                "i": 16
              },
              {
                "head": "Last Day HM Prod [Ton]",
                "data": "${bfiData["LADLE_BFTLMSPROD"].toStringAsFixed(2)}",
                "selected": false,
                "i": 17
              },
              {
                "head": "Flare Stack Flow [Nm3/hr]",
                "data": "${bfiData["BF_FLAREF"].toStringAsFixed(0)}",
                "selected": false,
                "i": 18
              },
              {
                "head": "Flare Stack Pressure [mmwc]",
                "data": "${bfiData["BF_FLAREP"].toStringAsFixed(0)}",
                "selected": false,
                "i": 19
              },
              // {
              //   "head": "Snort Position[%]",
              //   "data": "${bfiData["PBS_SNORT"].toStringAsFixed(0)}",
              //   "selected": false,
              //   "i": 23
              // },
              {
                "head": "Silicon[%]@ Sample time",
                "data":
                    "${bfiData["LAB_SI"].toStringAsFixed(2)}@${bfiData["LAB_HR"] ?? "0"}:${bfiData["LAB_MIN"] ?? "0"}",
                "selected": false,
                "i": 20
              },
              {
                "head": "Toredo Car 1/2/3/4 Level [%]",
                "data":
                    "${bfiData["TORPEDO1"].toStringAsFixed(0)}/${bfiData["TORPEDO2"].toStringAsFixed(0)}/${bfiData["TORPEDO3"].toStringAsFixed(0)}/${bfiData["TORPEDO4"].toStringAsFixed(0)}",
                "selected": false,
                "i": 21
              },
              {
                "head": "Toredo Car 5/6/7/8 Level [%]",
                "data":
                    "${bfiData["TORPEDO5"].toStringAsFixed(0)}/${bfiData["TORPEDO6"].toStringAsFixed(0)}/${bfiData["TORPEDO7"].toStringAsFixed(0)}/${bfiData["TORPEDO8"].toStringAsFixed(0)}",
                "selected": false,
                "i": 22
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: loading
          ? const Text(" ")
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
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 44, 129, 227),
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text(
                            "Parameter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text(
                            "Value",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 152, 152, 152),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
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
                          vertical: 0, horizontal: 3),
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
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Expanded(
      flex: 6,
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
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: Text(
            h,
            style: TextStyle(color: color),
          ),
        ),
      ),
    ),
    Expanded(
      flex: 3,
      child: Container(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: Text(
            d,
            style: TextStyle(color: color),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  ]);
}
