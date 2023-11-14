import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Mills extends StatefulWidget {
  const Mills({super.key});
  @override
  State<Mills> createState() {
    return MillsState();
  }
}

class MillsState extends State<Mills> {
  late dynamic millsData;
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
    BOFService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      // BOFService();
    });
  }

  List<dynamic> rows = [];

  BOFService() async {
    await mills().then((data) {
      if (mounted) {
        print(data.body);
        setState(() {
          millsData = json.decode(data.body);
          rows = [
            {
              "head": "A Shift Prod",
              "data1": millsData["WRM_A"].toString(),
              "data2": millsData["BRM_A"].toString(),
              "data3": millsData["USM_A"].toString(),
              "selected": false,
              "i": 0,
            },
            {
              "head": "B Shift Prod",
              "data1": millsData["WRM_B"].toString(),
              "data2": millsData["BRM_B"].toString(),
              "data3": millsData["USM_B"].toString(),
              "selected": false,
              "i": 1,
            },
            {
              "head": "C Shift Prod",
              "data1": millsData["WRM_C"].toString(),
              "data2": millsData["BRM_C"].toString(),
              "data3": millsData["USM_C"].toString(),
              "selected": false,
              "i": 2,
            },
            {
              "head": "Total Prod.",
              "data1": millsData["WRM_TOTAL"].toString(),
              "data2": millsData["BRM_TOTAL"].toString(),
              "data3": millsData["USM_TOTAL"].toString(),
              "selected": false,
              "i": 3,
            },
            {
              "head": "Prev. Day Total",
              "data1": millsData["WRM_PDAY"].toString(),
              "data2": millsData["BRM_PDAY"].toString(),
              "data3": millsData["USM_PDAY"].toString(),
              "selected": false,
              "i": 4,
            },
            {
              "head": "RH Temp [DegC]",
              "data1": millsData["WRM_RHF_TEMP"].toString(),
              "data2": millsData["BRM_RHF_TEMP"].toString(),
              "data3": millsData["USM_RHF_TEMP"].toString(),
              "selected": false,
              "i": 5,
            },
            {
              "head": "Oxygen [%]",
              "data1": millsData["WRM_RHF_O2"].toStringAsFixed(2),
              "data2": millsData["BRM_RHF_O2"].toStringAsFixed(2),
              "data3": millsData["USM_RHF_O2"].toStringAsFixed(2),
              "selected": false,
              "i": 6,
            },
            {
              "head": "Hot Charging (Billets)",
              "data1": "NA",
              "data2": millsData["BRM_HOT_CHARGING"].toString(),
              "data3": "NA",
              "selected": false,
              "i": 7,
            },
            {
              "head": "Last Billet/Bloom Rolled @",
              "data1": millsData["LAST_UPDATE_WRM"].toString(),
              "data2": millsData["LAST_UPDATE_BRM"].toString(),
              "data3": millsData["LAST_UPDATE_USM"].toString(),
              "selected": false,
              "i": 8,
            },
            {
              "head": "Mixed Gas Flow [Nm3/hr]",
              "data1": millsData["MG_WRM_FLOW"].toString(),
              "data2": millsData["MG_BRM_FLOW"].toString(),
              "data3": millsData["MG_USM_FLOW"].toString(),
              "selected": false,
              "i": 9,
            },
            {
              "head": "Shift Total MG Flow [Nm3]",
              "data1": millsData["WRM_TOT_GAS_SHIFT"].toString(),
              "data2": millsData["BRM_TOT_GAS_SHIFT"].toString(),
              "data3": millsData["USM_TOT_GAS_SHIFT"].toString(),
              "selected": false,
              "i": 10,
            },
            {
              "head": "Day Total MG Flow [Nm3]",
              "data1": millsData["WRM_TOT_GAS_DAY"].toString(),
              "data2": millsData["BRM_TOT_GAS_DAY"].toString(),
              "data3": millsData["USM_TOT_GAS_DAY"].toString(),
              "selected": false,
              "i": 11,
            },
            {
              "head": "Prev Day Total MG Flow [Nm3]",
              "data1": millsData["WRM_TOT_GAS_PDAY"].toString(),
              "data2": millsData["BRM_TOT_GAS_PDAY"].toString(),
              "data3": millsData["USM_TOT_GAS_PDAY"].toString(),
              "selected": false,
              "i": 12,
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: loading
          ? const Text("")
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(
                          113, 44, 129, 227), // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
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
                        flex: 1,
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
                          child: const Text("WRM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
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
                          child: const Text("BRM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("USM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152),
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
                          color: const Color.fromARGB(
                              113, 44, 129, 227), // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 3),
                      child: _row(
                          r["head"],
                          r["data1"],
                          r["data2"],
                          r["data3"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, d3, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 4,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Color.fromARGB(113, 44, 129, 227),
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(
            h,
            style: TextStyle(color: color),
          ),
        ),
      ),
      i == 11 || i == 12
          ? (Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ))
          : Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color.fromARGB(113, 44, 129, 227),
                      width: 2.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 11 || i == 12
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color.fromARGB(113, 44, 129, 227),
                      width: 2.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d2,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 11 || i == 12
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d3,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
      // Text(h, style: TextStyle(color: color)),
      // Text(d1, style: TextStyle(color: color)),
      // Text(d2, style: TextStyle(color: color)),
      // Text(d3, style: TextStyle(color: color)),
    ],
  );
}
