// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

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

  final Color _containerColor = const Color.fromARGB(255, 17, 156, 43);
  final Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  final Color _textColor = Color.fromARGB(255, 0, 0, 0);

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
            print(bfiData["OXY_FL_NL"].runtimeType);
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
                "head": "O2 Flow (new line) [Nm3/hr]",
                "data": (double.parse(bfiData["OXY_FL_NL"])).toStringAsFixed(2),
                "selected": false,
                "i": 12
              },
              {
                "head": "O2 Pressure (new line) [Kg/cm2]",
                "data": (double.parse(bfiData["OXY_PR_NL"])).toStringAsFixed(2),
                "selected": false,
                "i": 13
              },

              {
                "head": "Heat Load[Mcal]",
                "data": "${bfiData["TOTAL_HEAT_LOAD"].toStringAsFixed(2)}",
                "selected": false,
                "i": 14
              },
              {
                "head": "ETA CO [%]",
                "data": "${bfiData["BF_CO"].toStringAsFixed(2)}",
                "selected": false,
                "i": 15
              },
              {
                "head": "Charge Count",
                "data": "${bfiData["BF_CHARGE"].toStringAsFixed(2)}",
                "selected": false,
                "i": 16
              },
              {
                "head": "Ore Coke Ratio",
                "data": "${bfiData["OREBYCOKE"].toStringAsFixed(2)}",
                "selected": false,
                "i": 17
              },
              {
                "head": "Production rate",
                "data": "${bfiData["PROD_RATE"].toStringAsFixed(2)}",
                "selected": false,
                "i": 18
              },
              {
                "head": "Last Day HM Prod [Ton]",
                "data": "${bfiData["LADLE_BFTLMSPROD"].toStringAsFixed(2)}",
                "selected": false,
                "i": 19
              },
              {
                "head": "Flare Stack Flow [Nm3/hr]",
                "data": "${bfiData["BF_FLAREF"].toStringAsFixed(0)}",
                "selected": false,
                "i": 20
              },
              {
                "head": "Flare Stack Pressure [mmwc]",
                "data": "${bfiData["BF_FLAREP"].toStringAsFixed(0)}",
                "selected": false,
                "i": 21
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
                "i": 22
              },
              {
                "head": "Toredo Car 1/2/3/4 Level [%]",
                "data":
                    "${bfiData["TORPEDO1"].toStringAsFixed(0)}/${bfiData["TORPEDO2"].toStringAsFixed(0)}/${bfiData["TORPEDO3"].toStringAsFixed(0)}/${bfiData["TORPEDO4"].toStringAsFixed(0)}",
                "selected": false,
                "i": 23
              },
              {
                "head": "Toredo Car 5/6/7/8 Level [%]",
                "data": "${bfiData["TORPEDO5"] != null ? bfiData["TORPEDO5"].toStringAsFixed(0) : "0"}/"
                    "${bfiData["TORPEDO6"] != null ? bfiData["TORPEDO6"].toStringAsFixed(0) : "0"}/"
                    "${bfiData["TORPEDO7"] != null ? bfiData["TORPEDO7"].toStringAsFixed(0) : "0"}/"
                    "${bfiData["TORPEDO8"] != null ? bfiData["TORPEDO8"].toStringAsFixed(0) : "0"}",
                "selected": false,
                "i": 24
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
                child: Text('Something wrong'),
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
                      color: borderColor, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 3),
                          child: Text(
                            "Parameter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text(
                            "Value",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: borderColor,
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
                          color: borderColor, // Border color
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
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: borderColor,
              width: 2.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: Text(h,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600)),
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
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  ]);
}
