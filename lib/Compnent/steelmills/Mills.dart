// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

class Millssm extends StatefulWidget {
  const Millssm({super.key});
  @override
  State<Millssm> createState() {
    return MillssmState();
  }
}

class MillssmState extends State<Millssm> {
  late dynamic millsData;
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
    if (mounted) {
      millsService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        millsService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> state = [];

  millsService() async {
    if (mounted) {
      await mills().then((data) {
        if (data != null) {
          // print(data.body);
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
                "head": "Mixed Gas Flow [Nm3/hr]",
                "data1": millsData["MG_WRM_FLOW"].toString(),
                "data2": millsData["MG_BRM_FLOW"].toString(),
                "data3": millsData["MG_USM_FLOW"].toString(),
                "selected": false,
                "i": 5,
              },
              {
                "head": "Mixed Gas Pressure [mmwc]",
                "data1": millsData["MG_WRM_PRESSURE"].toString(),
                "data2": millsData["MG_BRM_PRESSURE"].toString(),
                "data3": millsData["MG_USM_PRESSURE"].toString(),
                "selected": false,
                "i": 6,
              },
              {
                "head": "Calorific Value",
                "data1": millsData["GAS_CV"].toString(),
                "data2": millsData["GAS_CV"].toString(),
                "data3": millsData["GAS_CV"].toString(),
                "selected": false,
                "i": 7,
              },
              {
                "head": "RH Temp [DegC]",
                "data1": millsData["WRM_RHF_TEMP"].toString(),
                "data2": millsData["BRM_RHF_TEMP"].toString(),
                "data3": millsData["USM_RHF_TEMP"].toString(),
                "selected": false,
                "i": 8,
              },
              {
                "head": "RH Oxygen [%]",
                "data1": millsData["WRM_RHF_O2"].toStringAsFixed(2),
                "data2": millsData["BRM_RHF_O2"].toStringAsFixed(2),
                "data3": millsData["USM_RHF_O2"].toStringAsFixed(2),
                "selected": false,
                "i": 9,
              },
              {
                "head": "Combustion Air Flow[Nm3/hr]",
                "data1": millsData["WRM_AIR_TOT"].toString(),
                "data2": millsData["BRM_AIR_TOT"].toString(),
                "data3": millsData["USM_AIR_TOT"].toString(),
                "selected": false,
                "i": 10,
              },
              {
                "head": "Last Billet/Bloom Rolled @",
                "data1": millsData["LAST_UPDATE_WRM"].toString(),
                "data2": millsData["LAST_UPDATE_BRM"].toString(),
                "data3": millsData["LAST_UPDATE_USM"].toString(),
                "selected": false,
                "i": 11,
              },
              {
                "head": "Hourly Rolling Data",
                "data1": "",
                "data2": millsData["LAST_UPDATE_BRM"].toString(),
                "data3": millsData["LAST_UPDATE_USM"].toString(),
                "selected": false,
                "i": 12,
              },
              {
                "head": "06:00-07:00",
                "data1": millsData["S1"].toString(),
                "data2": millsData["WS1"].toString(),
                "data3": millsData["US1"].toString(),
                "selected": false,
                "i": 13,
              },
              {
                "head": "07:00-08:00",
                "data1": millsData["S2"].toString(),
                "data2": millsData["WS2"].toString(),
                "data3": millsData["US2"].toString(),
                "selected": false,
                "i": 14,
              },
              {
                "head": "08:00-09:00",
                "data1": millsData["S3"].toString(),
                "data2": millsData["WS3"].toString(),
                "data3": millsData["US3"].toString(),
                "selected": false,
                "i": 15,
              },
              {
                "head": "09:00-10:00",
                "data1": millsData["S4"].toString(),
                "data2": millsData["WS4"].toString(),
                "data3": millsData["US4"].toString(),
                "selected": false,
                "i": 16,
              },
              {
                "head": "10:00-11:00",
                "data1": millsData["S5"].toString(),
                "data2": millsData["WS5"].toString(),
                "data3": millsData["US5"].toString(),
                "selected": false,
                "i": 17,
              },
              {
                "head": "11:00-12:00",
                "data1": millsData["S6"].toString(),
                "data2": millsData["WS6"].toString(),
                "data3": millsData["US6"].toString(),
                "selected": false,
                "i": 18,
              },
              {
                "head": "12:00-13:00",
                "data1": millsData["S7"].toString(),
                "data2": millsData["WS7"].toString(),
                "data3": millsData["US7"].toString(),
                "selected": false,
                "i": 19,
              },
              {
                "head": "13:00-14:00",
                "data1": millsData["S8"].toString(),
                "data2": millsData["WS8"].toString(),
                "data3": millsData["US8"].toString(),
                "selected": false,
                "i": 20,
              },
              {
                "head": "14:00-15:00",
                "data1": millsData["S9"].toString(),
                "data2": millsData["WS9"].toString(),
                "data3": millsData["US9"].toString(),
                "selected": false,
                "i": 21,
              },
              {
                "head": "15:00-16:00",
                "data1": millsData["S10"].toString(),
                "data2": millsData["WS10"].toString(),
                "data3": millsData["US10"].toString(),
                "selected": false,
                "i": 22,
              },
              {
                "head": "16:00-17:00",
                "data1": millsData["S11"].toString(),
                "data2": millsData["WS11"].toString(),
                "data3": millsData["US11"].toString(),
                "selected": false,
                "i": 23,
              },
              {
                "head": "17:00-18:00",
                "data1": millsData["S12"].toString(),
                "data2": millsData["WS12"].toString(),
                "data3": millsData["US12"].toString(),
                "selected": false,
                "i": 24,
              },
              {
                "head": "18:00-19:00",
                "data1": millsData["S13"].toString(),
                "data2": millsData["WS13"].toString(),
                "data3": millsData["US13"].toString(),
                "selected": false,
                "i": 25,
              },
              {
                "head": "19:00-20:00",
                "data1": millsData["S14"].toString(),
                "data2": millsData["WS14"].toString(),
                "data3": millsData["US14"].toString(),
                "selected": false,
                "i": 26,
              },
              {
                "head": "20:00-21:00",
                "data1": millsData["S15"].toString(),
                "data2": millsData["WS15"].toString(),
                "data3": millsData["US15"].toString(),
                "selected": false,
                "i": 27,
              },
              {
                "head": "21:00-22:00",
                "data1": millsData["S16"].toString(),
                "data2": millsData["WS16"].toString(),
                "data3": millsData["US16"].toString(),
                "selected": false,
                "i": 28,
              },
              {
                "head": "22:00-23:00",
                "data1": millsData["S17"].toString(),
                "data2": millsData["WS17"].toString(),
                "data3": millsData["US17"].toString(),
                "selected": false,
                "i": 29,
              },
              {
                "head": "23:00-00:00",
                "data1": millsData["S18"].toString(),
                "data2": millsData["WS18"].toString(),
                "data3": millsData["US18"].toString(),
                "selected": false,
                "i": 30,
              },
              {
                "head": "00:00-01:00",
                "data1": millsData["S19"].toString(),
                "data2": millsData["WS19"].toString(),
                "data3": millsData["US19"].toString(),
                "selected": false,
                "i": 31,
              },
              {
                "head": "01:00-02:00",
                "data1": millsData["S20"].toString(),
                "data2": millsData["WS20"].toString(),
                "data3": millsData["US20"].toString(),
                "selected": false,
                "i": 32,
              },
              {
                "head": "02:00-03:00",
                "data1": millsData["S21"].toString(),
                "data2": millsData["WS21"].toString(),
                "data3": millsData["US21"].toString(),
                "selected": false,
                "i": 33,
              },
              {
                "head": "03:00-04:00",
                "data1": millsData["S22"].toString(),
                "data2": millsData["WS22"].toString(),
                "data3": millsData["US22"].toString(),
                "selected": false,
                "i": 34,
              },
              {
                "head": "04:00-05:00",
                "data1": millsData["S23"].toString(),
                "data2": millsData["WS23"].toString(),
                "data3": millsData["US23"].toString(),
                "selected": false,
                "i": 35,
              },
              {
                "head": "05:00-06:00",
                "data1": millsData["S24"].toString(),
                "data2": millsData["WS24"].toString(),
                "data3": millsData["US24"].toString(),
                "selected": false,
                "i": 36,
              },
            ];
            state = [
              {
                "wrm": millsData["DIFF"],
                "brm": millsData["DIFF1"],
                "usm": millsData["DIFF22"]
              }
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
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: borderColor,
                                  width: 2.0,
                                ),
                              ),
                              color: state[0]["wrm"] >= 360
                                  ? myColors["deactive"]
                                  : myColors["active"]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("WRM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: myColors["header"],
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: borderColor,
                                  width: 2.0,
                                ),
                              ),
                              color: state[0]["brm"] >= 360
                                  ? myColors["deactive"]
                                  : myColors["active"]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("BRM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: myColors["header"],
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: state[0]["usm"] >= 660
                                  ? myColors["deactive"]
                                  : myColors["active"]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("USM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: myColors["header"],
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
                          vertical: 0, horizontal: 0),
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
          decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: borderColor,
                  width: 2.0,
                ),
              ),
              color: i > 12 && i < 21
                  ? myColors["active"]
                  : i > 20 && i < 29
                      ? myColors["mid"]
                      : i > 28
                          ? myColors["last"]
                          : const Color.fromARGB(0, 255, 193, 7)),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: Text(
            h,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ),
      ),
      i == 12
          ? (Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color, fontSize: 12),
                    textAlign: TextAlign.center),
              ),
            ))
          : Expanded(
              flex: 1,
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
                child: Text(d1,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 12
          ? const Text("")
          : Expanded(
              flex: 1,
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
                child: Text(d2,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 12
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d3,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
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
