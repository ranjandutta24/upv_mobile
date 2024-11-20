// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';
import 'package:in.iisco.upv/Widgets/counting.dart';

class BofGasHoldUt extends StatefulWidget {
  const BofGasHoldUt({super.key});
  @override
  State<BofGasHoldUt> createState() {
    return BofGasHoldUtState();
  }
}

class BofGasHoldUtState extends State<BofGasHoldUt> {
  late dynamic gasholdData;
  var loading = true;
  var num = -1;
  @override
  void initState() {
    super.initState();
    fun();
  }

  final Color _containerColor = const Color.fromARGB(255, 17, 156, 43);
  final Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  final Color _textColor = const Color.fromARGB(255, 44, 44, 44);

  _changeColor(no) {
    setState(() {
      for (int i = 0; i < shiftTable.length; i++) {
        shiftTable[i]["selected"] = false;
      }
      for (int i = 0; i < rows.length; i++) {
        rows[i]["selected"] = false;
      }
      rows[no]["selected"] = true;
      num = no;
    });
  }

  _changeColortable(no) {
    setState(() {
      for (int i = 0; i < rows.length; i++) {
        rows[i]["selected"] = false;
      }
      for (int i = 0; i < shiftTable.length; i++) {
        shiftTable[i]["selected"] = false;
      }

      shiftTable[no]["selected"] = true;
      // num = no;
    });
  }

  fun() {
    if (mounted) {
      bofgasholderService();
      var duration = const Duration(seconds: 1);
      Timer.periodic(duration, (Timer timer) {
        bofgasholderService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> shiftTable = [];

  bofgasholderService() async {
    if (mounted) {
      await bofgasholder().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            gasholdData = json.decode(data.body);
            rows = [
              {
                "head": "Gas Holder Level [metre]",
                "data1": gasholdData["GASHOLDERLVL"],
                "selected": false,
                "i": 0,
              },
              {
                "head": "Gas Holder Pressure [mmWC]",
                "data1": gasholdData["GASHOLDERPRES"],
                "data2": "",
                "selected": false,
                "i": 1,
              },
              {
                "head": "Gas Holder Temperature [DegC]",
                "data1": gasholdData["GASHOLDERTEMP"],
                "data2": "",
                "selected": false,
                "i": 2,
              },
              {
                "head": "Exported Gas PBS [Nm3/hr]",
                "data1": gasholdData["EXPORTEDGAS"],
                "data2": "",
                "selected": false,
                "i": 3,
              },
              {
                "head": "Exported Gas Mills [Nm3/hr]",
                "data1": gasholdData["GAS_FLOW_mills"],
                "data2": "",
                "selected": false,
                "i": 4,
              },
              {
                "head": "Totaliser LD Gas(Mills+PBS) (Nm3)",
                "data1": gasholdData["PBS_totaliser"],
                "data2": "",
                "selected": false,
                "i": 5,
              },
              {
                "head": "Totaliser LD Gas Mills (Nm3)",
                "data1": gasholdData["Mills_totaliser"],
                "data2": "",
                "selected": false,
                "i": 6,
              },
              {
                "head": "Totaliser LD Gas PBS (Nm3)",
                "data1": (gasholdData["PBS_totaliser"] -
                    gasholdData["Mills_totaliser"]),
                "data2": "",
                "selected": false,
                "i": 7,
              },
            ];
            shiftTable = [
              {
                "head": "LD Gas Mills+PBS Shift (Nm3)",
                "aShift": gasholdData["a_pbs_totaliser"],
                "bShift": gasholdData["b_pbs_totaliser"],
                "cShift": gasholdData["c_pbs_totaliser"],
                "i": 0,
                "selected": false,
              },
              {
                "head": "LD Gas Mills Shift (Nm3)",
                "aShift": gasholdData["a_mills_totaliser"],
                "bShift": gasholdData["b_mills_totaliser"],
                "cShift": gasholdData["c_mills_totaliser"],
                "i": 1,
                "selected": false,
              },
              {
                "head": "LD Gas PBS Shift (Nm3)",
                "aShift": (gasholdData["a_pbs_totaliser"] -
                    gasholdData["a_mills_totaliser"]),
                "bShift": (gasholdData["b_pbs_totaliser"] -
                    gasholdData["b_mills_totaliser"]),
                "cShift": (gasholdData["c_pbs_totaliser"] -
                    gasholdData["c_mills_totaliser"]),
                "i": 2,
                "selected": false,
              },
            ];
            if (num != -1) {
              rows[num]["selected"] = true;
              shiftTable[num]["selected"] = true;
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
          ? const Text("")
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
                        flex: 4,
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
                        flex: 2,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("Value",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
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
                          r["data1"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
                for (final Map r in shiftTable)
                  GestureDetector(
                    onTap: () {
                      _changeColortable(r["i"]);
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
                          vertical: 0, horizontal: 0),
                      child: _tableRow(
                          r["head"],
                          r["aShift"],
                          r["bShift"],
                          r["cShift"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 4,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(
            h,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
            decoration: const BoxDecoration(),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Counting(value: d1)),
      ),
    ],
  );
}

Widget _tableRow(h, a, b, c, color, i) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 150, 172, 206),
                border: Border(
                  bottom: BorderSide(
                    color: borderColor,
                    width: 2.0,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
              child: Text(
                h,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Expanded(
            // flex: 4,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: borderColor,
                    width: 2.0,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Counting(
                value: a,
              ),
            ),
          ),
          Expanded(
            // flex: 4,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: borderColor,
                    width: 2.0,
                  ),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Counting(
                value: b,
              ),
            ),
          ),
          Expanded(
            // flex: 2,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Counting(
                value: c,
              ),
            ),
          ),
        ],
      )
    ],
  );
}
