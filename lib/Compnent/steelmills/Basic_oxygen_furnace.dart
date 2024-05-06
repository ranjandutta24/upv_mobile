// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class BOFsm extends StatefulWidget {
  const BOFsm({super.key});
  @override
  State<BOFsm> createState() {
    return BOFsmState();
  }
}

class BOFsmState extends State<BOFsm> {
  late dynamic bofData;
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
      for (int i = 0; i < rows.length; i++) {
        rows[i]["selected"] = false;
      }
      rows[no]["selected"] = true;
      num = no;
    });
  }

  fun() {
    if (mounted) {
      bfService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        bfService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> status = [];

  bfService() async {
    if (mounted) {
      await basicoxygenfurnace().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            bofData = json.decode(data.body);
            rows = [
              {
                "head": "Heat A/B/C",
                "data1":
                    "${bofData["BOF1_A"].toStringAsFixed(0)}/${bofData["BOF1_B"].toString()}/${bofData["BOF1_C"].toString()}",
                "data2":
                    "${bofData["BOF2_A"].toStringAsFixed(0)}/${bofData["BOF2_B"].toString()}/${bofData["BOF2_C"].toString()}",
                "data3":
                    "${bofData["BOF3_A"].toStringAsFixed(0)}/${bofData["BOF3_B"].toString()}/${bofData["BOF3_C"].toString()}",
                "selected": false,
                "i": 0,
              },
              {
                "head": "Total Heat",
                // "data1": (bofData["BOF1_A"] +
                //         bofData["BOF1_B"] +
                //         bofData["BOF1_C"] +
                //         bofData["BOF2_A"] +
                //         bofData["BOF2_B"] +
                //         bofData["BOF2_C"] +
                //         bofData["BOF3_A"] +
                //         bofData["BOF3_B"] +
                //         bofData["BOF3_C"])
                //     .toString(),
                "data1": bofData["TOTAL_HEAT"].toStringAsFixed(0),
                "data2": " ",
                "data3": " ",
                "selected": false,
                "i": 1,
              },
              {
                "head": "Prev. Day Heat",
                "data1":
                    "${(bofData["BOF1_PDAY"] + bofData["BOF2_PDAY"] + bofData["BOF3_PDAY"]).toString()} (${bofData["BOF1_PDAY"].toString()} + ${bofData["BOF2_PDAY"].toString()} + ${bofData["BOF3_PDAY"].toString()})",
                "data2": bofData["BOF2_PDAY"].toString(),
                "data3": bofData["BOF3_PDAY"].toString(),
                "selected": false,
                "i": 2,
              },
              {
                "head": "Heat No",
                "data1": bofData["BOF1_HEAT"].toString(),
                "data2": bofData["BOF2_HEAT"].toString(),
                "data3": bofData["BOF3_HEAT"].toString(),
                "selected": false,
                "i": 3,
              },
              {
                "head": "Status",
                "data1": "${bofData["BOF1_STATUS"]}",
                "data2": "${bofData["BOF2_STATUS"]}",
                "data3": "${bofData["BOF3_STATUS"]}",
                "selected": false,
                "i": 4,
              },
              {
                "head": "Last Blow Start Time",
                "data1": bofData["BOF1_HEATSTART"],
                "data2": bofData["BOF2_HEATSTART"],
                "data3": bofData["BOF3_HEATSTART"],
                "selected": false,
                "i": 5,
              },
              {
                "head": " Blow Duration(Mins)",
                "data1": bofData["BOF1_LASTHEATDURATION"] == null
                    ? "N/A"
                    : bofData["BOF1_LASTHEATDURATION"].toString(),
                "data2": bofData["BOF2_LASTHEATDURATION"] == null
                    ? "N/A"
                    : bofData["BOF2_LASTHEATDURATION"].toString(),
                "data3": bofData["BOF3_LASTHEATDURATION"] == null
                    ? "N/A"
                    : bofData["BOF3_LASTHEATDURATION"].toString(),
                "selected": false,
                "i": 6,
              },
              {
                "head": "Charge To Tap Duration (Mins)",
                "data1": bofData["BOF1_LASTC2T"] == null
                    ? "N/A"
                    : bofData["BOF1_LASTC2T"].toString(),
                "data2": bofData["BOF2_LASTC2T"] == null
                    ? "N/A"
                    : bofData["BOF2_LASTC2T"].toString(),
                "data3": bofData["BOF3_LASTC2T"] == null
                    ? "N/A"
                    : bofData["BOF3_LASTC2T"].toString(),
                "selected": false,
                "i": 7,
              },
              {
                "head": "Tap To Tap Duration(Mins)",
                "data1": bofData["BOF1_LASTT2T"] == null
                    ? "N/A"
                    : bofData["BOF1_LASTT2T"].toString(),
                "data2": bofData["BOF2_LASTT2T"] == null
                    ? "N/A"
                    : bofData["BOF2_LASTT2T"].toString(),
                "data3": bofData["BOF3_LASTT2T"] == null
                    ? "N/A"
                    : bofData["BOF3_LASTT2T"].toString(),
                "selected": false,
                "i": 8,
              },
              {
                "head": "Last Tapping Finish Time",
                "data1": bofData["BOF1_LAST"] ?? "N/A",
                "data2": bofData["BOF2_LAST"] ?? "N/A",
                "data3": bofData["BOF3_LAST"] ?? "N/A",
                "selected": false,
                "i": 9,
              },
              {
                "head": "Lance in Operation",
                "data1": bofData["LANCESTATUS_1"].toString(),
                "data2": bofData["LANCESTATUS_2"].toString(),
                "data3": bofData["LANCESTATUS_3"].toString(),
                "selected": false,
                "i": 10,
              },
              {
                "head": "Lining Life",
                "data1": bofData["LINING_1"].toString(),
                "data2": bofData["LINING_2"].toString(),
                "data3": bofData["LINING_3"].toString(),
                "selected": false,
                "i": 11,
              },
              {
                "head": "Temp [DegC]",
                "data1": bofData["TEMP_1"].toString(),
                "data2": bofData["TEMP_2"].toString(),
                "data3": bofData["TEMP_3"].toString(),
                "selected": false,
                "i": 12,
              },
              {
                "head": "O2 Flow [Nm3/min]",
                "data1": bofData["O2FLOWL1"].toStringAsFixed(2),
                "data2": bofData["O2FLOWL2"].toStringAsFixed(2),
                "data3": bofData["O2FLOWL3"].toStringAsFixed(2),
                "selected": false,
                "i": 13,
              },
              {
                "head": "O2 Consm [Nm3]",
                "data1": bofData["O2FLOWL11"].toStringAsFixed(0),
                "data2": bofData["O2FLOWL22"].toStringAsFixed(0),
                "data3": bofData["O2FLOWL33"].toStringAsFixed(0),
                "selected": false,
                "i": 14,
              },
              {
                "head": "Gas Recovery Status",
                "data1": "${bofData["REC_1"]}",
                "data2": "${bofData["REC_2"]}",
                "data3": "${bofData["REC_3"]}",
                "selected": false,
                "i": 15,
              },
              {
                "head": "Gas Recovery Per heat[Nm3]",
                "data1": bofData["GASREC_1"].toStringAsFixed(0),
                "data2": bofData["GASREC_2"].toStringAsFixed(0),
                "data3": bofData["GASREC_3"].toStringAsFixed(0),
                "selected": false,
                "i": 16,
              },
              {
                "head": "Gas Recovery [Nm3]x 1000",
                "data1": bofData["BOF1_GASRECTOT"].toStringAsFixed(0),
                "data2": bofData["BOF2_GASRECTOT"].toStringAsFixed(0),
                "data3": bofData["BOF3_GASRECTOT"].toStringAsFixed(0),
                "selected": false,
                "i": 17,
              },
              {
                "head": "CBM Gas Consm (Flow)[Nm3/hr]",
                "data1": bofData["BOF_CBMF"].toStringAsFixed(0),
                "data2": " ",
                "data3": " ",
                "selected": false,
                "i": 18,
              },
              {
                "head": "CBM Gas Consm (Pressure) [mmwc]",
                "data1": bofData["BOF_CBMP"].toStringAsFixed(0),
                "data2": " ",
                "data3": " ",
                "selected": false,
                "i": 19,
              },
              {
                "head": "N2 Flow [Nm3/min]",
                "data1": bofData["BOF1_N2CON"].toStringAsFixed(0),
                "data2": bofData["BOF2_N2CON"].toStringAsFixed(0),
                "data3": bofData["BOF3_N2CON"].toStringAsFixed(0),
                "selected": false,
                "i": 20,
              },
              {
                "head": "Dry Gas O2[%]",
                "data1": bofData["BOF1_O2"].toStringAsFixed(0),
                "data2": bofData["BOF2_O2"].toStringAsFixed(0),
                "data3": bofData["BOF3_O2"].toStringAsFixed(0),
                "selected": false,
                "i": 21,
              },
              {
                "head": "ID Fan RPM",
                "data1": bofData["IDFAN_1"].toStringAsFixed(2),
                "data2": bofData["IDFAN_2"].toStringAsFixed(2),
                "data3": bofData["IDFAN_3"].toStringAsFixed(2),
                "selected": false,
                "i": 22,
              },
              {
                "head": "PRS 1 N2 Flow[Nm3/hr]",
                "data1": bofData["BOF_PRS1F"].toStringAsFixed(0),
                "data2": " ",
                "data3": " ",
                "selected": false,
                "i": 23,
              },
              {
                "head": "PRS 2 N2 Flow[Nm3/hr]",
                "data1": bofData["BOF_PRS2F"].toStringAsFixed(0),
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 24,
              },
              {
                "head": "PRS 3 N2 Flow[Nm3/hr]",
                "data1": bofData["BOF_PRS3F"].toStringAsFixed(0),
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 25,
              },
            ];
            status = [
              {
                "BOF1": bofData["REC_1"],
                "BOF2": bofData["REC_2"],
                "BOF3": bofData["REC_3"],
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
          ? const SizedBox(
              height: 30, width: 30, child: CircularProgressIndicator())
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
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(238, 205, 205, 205),
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
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: rows[4]["data1"] == "Stop"
                                ? myColors["deactive"]
                                : myColors["active"],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("BOF1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: borderColor,
                                  width: 2.0,
                                ),
                              ),
                              color: rows[4]["data2"] == "Stop"
                                  ? myColors["deactive"]
                                  : myColors["active"]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("BOF2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              color: rows[4]["data3"] == "Stop"
                                  ? myColors["deactive"]
                                  : myColors["active"]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("BOF3",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
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
                          r["i"],
                          status),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, d3, color, i, status) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 8,
        child: Container(
          height: 46,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: Text(
            h,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      i == 1 || i == 2 || i == 18 || i == 19 || i == 23 || i == 24 || i == 25
          ? (Expanded(
              flex: 9,
              child: Container(
                height: 46,
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
              ),
            ))
          : Expanded(
              flex: 3,
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: borderColor,
                        width: 2.0,
                      ),
                    ),
                    color: i == 15
                        ? status[0]["BOF1"] == "On"
                            ? myColors["active"]
                            : myColors["deactive"]
                        : const Color.fromARGB(0, 255, 7, 7)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  child: Text(d1,
                      style: TextStyle(
                          color: color,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
      i == 1 || i == 2 || i == 18 || i == 19 || i == 23 || i == 24 || i == 25
          ? const Text("")
          : Expanded(
              flex: 3,
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: borderColor,
                        width: 2.0,
                      ),
                    ),
                    color: i == 15
                        ? status[0]["BOF2"] == "On"
                            ? myColors["active"]
                            : myColors["deactive"]
                        : const Color.fromARGB(0, 255, 7, 7)),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d2,
                    style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 1 || i == 2 || i == 18 || i == 19 || i == 23 || i == 24 || i == 25
          ? const Text("")
          : Expanded(
              flex: 3,
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                    color: i == 15
                        ? status[0]["BOF3"] == "On"
                            ? myColors["active"]
                            : myColors["deactive"]
                        : const Color.fromARGB(0, 255, 7, 7)),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d3,
                    style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
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
