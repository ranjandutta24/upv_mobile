// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class Ccpsm extends StatefulWidget {
  const Ccpsm({super.key});
  @override
  State<Ccpsm> createState() {
    return CcpsmState();
  }
}

class CcpsmState extends State<Ccpsm> {
  late dynamic ccpData;
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
      ccpService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        ccpService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> status = [];

  ccpService() async {
    if (mounted) {
      await continuouscastingplant().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            ccpData = json.decode(data.body);
            rows = [
              {
                "head": "Cast",
                "data1":
                    "${ccpData["CCP1_A"].toString()}/${ccpData["CCP1_B"].toString()}/${ccpData["CCP1_C"].toString()}",
                "data2":
                    "${ccpData["CCP2_A"].toString()}/${ccpData["CCP2_B"].toString()}/${ccpData["CCP3_C"].toString()}",
                "data3":
                    "${ccpData["CCP3_A"].toString()}/${ccpData["CCP3_B"].toString()}/${ccpData["CCP3_C"].toString()}",
                "selected": false,
                "i": 0,
              },
              {
                "head": "Ladle Weight [Ton]",
                "data1": ccpData["LADLEWEIGHT1"].toStringAsFixed(2),
                "data2": ccpData["LADLEWEIGHT2"].toStringAsFixed(2),
                "data3": ccpData["LADLEWEIGHT3"].toStringAsFixed(2),
                "selected": false,
                "i": 1,
              },
              {
                "head": "Tundish Temp [DegC]",
                "data1": ccpData["TUNDISHTEMP1"].toString(),
                "data2": ccpData["TUNDISHTEMP2"].toString(),
                "data3": ccpData["TUNDISHTEMP3"].toString(),
                "selected": false,
                "i": 2,
              },
              {
                "head": "Tundish Weight [Ton]",
                "data1": ccpData["TUNDISHWEIGHT1"].toString(),
                "data2": ccpData["TUNDISHWEIGHT2"].toString(),
                "data3": ccpData["TUNDISHWEIGHT3"].toString(),
                "selected": false,
                "i": 3,
              },
              {
                "head": "Tundish",
                "data1": "${ccpData["CCP_1TCCAR"]}",
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 4,
              },
              //CCP_2TCCAR CCP_3TCCAR do i need to add this?
              {
                "head": "Billet Cast",
                "data1": "",
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 5,
              },
              {
                "head": "Strand 1",
                "data1": "${ccpData["CCP_1WDSPDSD1S"]}",
                "data2": "${ccpData["CCP_2WDSPDSD1S"]}",
                "data3": "${ccpData["CCP_3WDSPDSD1S"]}",
                "selected": false,
                "i": 6,
              },
              {
                "head": "Strand 2",
                "data1": "${ccpData["CCP_1WDSPDSD2S"]}",
                "data2": "${ccpData["CCP_2WDSPDSD2S"]}",
                "data3": "${ccpData["CCP_3WDSPDSD2S"]}",
                "selected": false,
                "i": 7,
              },
              {
                "head": "Strand 3",
                "data1": "${ccpData["CCP_1WDSPDSD3S"]}",
                "data2": "${ccpData["CCP_2WDSPDSD3S"]}",
                "data3": "${ccpData["CCP_3WDSPDSD3S"]}",
                "selected": false,
                "i": 8,
              },
              {
                "head": "Strand 4",
                "data1": "${ccpData["CCP_1WDSPDSD4S"]}",
                "data2": "${ccpData["CCP_2WDSPDSD4S"]}",
                "data3": "${ccpData["CCP_3WDSPDSD4S"]}",
                "selected": false,
                "i": 9,
              },
              {
                "head": "Strand 5",
                "data1": "${ccpData["CCP_1WDSPDSD5S"]}",
                "data2": "${ccpData["CCP_2WDSPDSD5S"]}",
                "data3": "",
                "selected": false,
                "i": 10,
              },
              {
                "head": "Strand 6",
                "data1": "${ccpData["CCP_1WDSPDSD6S"]}",
                "data2": "${ccpData["CCP_2WDSPDSD6S"]}",
                "data3": "",
                "selected": false,
                "i": 11,
              },
              {
                "head": "Strand 1 Duration ",
                "data1":
                    "${ccpData["HH1_1"].toStringAsFixed(0)}:${ccpData["MM1_1"].toString()}:${ccpData["SS1_1"].toString()}",
                "data2":
                    "${ccpData["HH2_1"].toStringAsFixed(0)}:${ccpData["MM2_1"].toString()}:${ccpData["SS2_1"].toString()}",
                "data3":
                    "${ccpData["HH3_1"].toStringAsFixed(0)}:${ccpData["MM3_1"].toString()}:${ccpData["SS3_1"].toString()}",
                "selected": false,
                "i": 12,
              },
              {
                "head": "Strand 2 Duration ",
                "data1":
                    "${ccpData["HH1_2"].toStringAsFixed(0)}:${ccpData["MM1_2"].toString()}:${ccpData["SS1_2"].toString()}",
                "data2":
                    "${ccpData["HH2_2"].toStringAsFixed(0)}:${ccpData["MM2_2"].toString()}:${ccpData["SS2_2"].toString()}",
                "data3":
                    "${ccpData["HH3_2"].toStringAsFixed(0)}:${ccpData["MM3_2"].toString()}:${ccpData["SS3_2"].toString()}",
                "selected": false,
                "i": 13,
              },
              {
                "head": "Strand 3 Duration ",
                "data1":
                    "${ccpData["HH1_3"].toStringAsFixed(0)}:${ccpData["MM1_3"].toString()}:${ccpData["SS1_3"].toString()}",
                "data2":
                    "${ccpData["HH2_3"].toStringAsFixed(0)}:${ccpData["MM2_3"].toString()}:${ccpData["SS2_3"].toString()}",
                "data3":
                    "${ccpData["HH3_3"].toStringAsFixed(0)}:${ccpData["MM3_3"].toString()}:${ccpData["SS3_3"].toString()}",
                "selected": false,
                "i": 14,
              },
              {
                "head": "Strand 4 Duration ",
                "data1":
                    "${ccpData["HH1_4"].toStringAsFixed(0)}:${ccpData["MM1_4"].toString()}:${ccpData["SS1_4"].toString()}",
                "data2":
                    "${ccpData["HH2_4"].toStringAsFixed(0)}:${ccpData["MM2_4"].toString()}:${ccpData["SS2_4"].toString()}",
                "data3":
                    "${ccpData["HH3_4"].toStringAsFixed(0)}:${ccpData["MM3_4"].toString()}:${ccpData["SS3_4"].toString()}",
                "selected": false,
                "i": 15,
              },
              {
                "head": "Strand 5 Duration ",
                "data1":
                    "${ccpData["HH1_5"].toStringAsFixed(0)}:${ccpData["MM1_5"].toString()}:${ccpData["SS1_5"].toString()}",
                "data2":
                    "${ccpData["HH2_5"].toStringAsFixed(0)}:${ccpData["MM2_5"].toString()}:${ccpData["SS2_5"].toString()}",
                "data3": "",
                "selected": false,
                "i": 16,
              },
              {
                "head": "Strand 6 Duration ",
                "data1":
                    "${ccpData["HH1_6"].toStringAsFixed(0)}:${ccpData["MM1_6"].toString()}:${ccpData["SS1_6"].toString()}",
                "data2":
                    "${ccpData["HH2_6"].toStringAsFixed(0)}:${ccpData["MM2_6"].toString()}:${ccpData["SS2_6"].toString()}",
                "data3": "",
                "selected": false,
                "i": 17,
              },
              {
                "head": "Oxygen Consm.[Nm3/hr]",
                "data1": ccpData["O2_F"] == null
                    ? "0"
                    : ccpData["O2_F"].toStringAsFixed(0),
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 18,
              },
              {
                "head": "N2 Consm.[Nm3/hr]",
                "data1": ccpData["N2_F"] == null
                    ? "0"
                    : ccpData["N2_F"].toStringAsFixed(0),
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 19,
              },
              {
                "head": "Argon Consm.[Nm3/hr]",
                "data1": "",
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 20,
              },
              {
                "head": "CBM Consm.[Nm3/hr]",
                "data1": ccpData["CBM_F"] == null
                    ? "0"
                    : ccpData["CBM_F"].toStringAsFixed(0),
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 21,
              },
              {
                "head": "COG Consm.[Nm3/hr]",
                "data1": "",
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 22,
              },
              {
                "head": "Prev. Day Cast",
                "data1": ccpData["CCPPRETOTAL"].toString(),
                "data2": "",
                "data3": "",
                "selected": false,
                "i": 23,
              },
              {
                "head": "Ladle Running Count.",
                "data1": ccpData["LADLENO_1"].toString(),
                "data2": ccpData["LADLENO_2"].toString(),
                "data3": ccpData["LADLENO_3"].toString(),
                "selected": false,
                "i": 24,
              },

              {
                "head": "Casting Speed Strand 1",
                "data1": ccpData["WITHDRAWALSPEED1_1"].toStringAsFixed(2),
                "data2": ccpData["WITHDRAWALSPEED2_1"].toStringAsFixed(2),
                "data3": ccpData["WITHDRAWALSPEED3_1"].toStringAsFixed(2),
                "selected": false,
                "i": 25,
              },
              {
                "head": "Casting Speed Strand 2",
                "data1": ccpData["WITHDRAWALSPEED1_2"].toStringAsFixed(2),
                "data2": ccpData["WITHDRAWALSPEED2_2"].toStringAsFixed(2),
                "data3": ccpData["WITHDRAWALSPEED3_2"].toStringAsFixed(2),
                "selected": false,
                "i": 26,
              },
              {
                "head": "Casting Speed Strand 3",
                "data1": ccpData["WITHDRAWALSPEED1_3"].toStringAsFixed(2),
                "data2": ccpData["WITHDRAWALSPEED2_3"].toStringAsFixed(2),
                "data3": ccpData["WITHDRAWALSPEED3_3"].toStringAsFixed(2),
                "selected": false,
                "i": 27,
              },
              {
                "head": "Casting Speed Strand 4",
                "data1": ccpData["WITHDRAWALSPEED1_4"].toStringAsFixed(2),
                "data2": ccpData["WITHDRAWALSPEED2_4"].toStringAsFixed(2),
                "data3": ccpData["WITHDRAWALSPEED3_4"].toStringAsFixed(2),
                "selected": false,
                "i": 28,
              },
              {
                "head": "Casting Speed Strand 5",
                "data1": ccpData["WITHDRAWALSPEED1_5"].toStringAsFixed(2),
                "data2": ccpData["WITHDRAWALSPEED2_5"].toStringAsFixed(2),
                "data3": "",
                "selected": false,
                "i": 29,
              },
              {
                "head": "Casting Speed Strand 6",
                "data1": ccpData["WITHDRAWALSPEED1_6"].toStringAsFixed(2),
                "data2": ccpData["WITHDRAWALSPEED2_6"].toStringAsFixed(2),
                "data3": "",
                "selected": false,
                "i": 30,
              },
              {
                "head": "Stopper Position Strand 1",
                "data1": ccpData["C1_S1"].toStringAsFixed(2),
                "data2": ccpData["C2_S1"].toStringAsFixed(2),
                "data3": ccpData["C3_S1"].toStringAsFixed(2),
                "selected": false,
                "i": 31,
              },
              {
                "head": "Stopper Position Strand 2",
                "data1": ccpData["C1_S2"].toStringAsFixed(2),
                "data2": ccpData["C2_S2"].toStringAsFixed(2),
                "data3": ccpData["C3_S2"].toStringAsFixed(2),
                "selected": false,
                "i": 32,
              },
              {
                "head": "Stopper Position Strand 3",
                "data1": ccpData["C1_S3"].toStringAsFixed(2),
                "data2": ccpData["C2_S3"].toStringAsFixed(2),
                "data3": ccpData["C3_S3"].toStringAsFixed(2),
                "selected": false,
                "i": 33,
              },
              {
                "head": "Stopper Position Strand 4",
                "data1": ccpData["C1_S4"].toStringAsFixed(2),
                "data2": ccpData["C2_S4"].toStringAsFixed(2),
                "data3": ccpData["C3_S4"].toStringAsFixed(2),
                "selected": false,
                "i": 34,
              },
              {
                "head": "Stopper Position Strand 5",
                "data1": ccpData["C1_S5"].toStringAsFixed(2),
                "data2": ccpData["C2_S5"].toStringAsFixed(2),
                "data3": "",
                "selected": false,
                "i": 35,
              },
              {
                "head": "Stopper Position Strand 6",
                "data1": ccpData["C1_S6"].toStringAsFixed(2),
                "data2": ccpData["C2_S6"].toStringAsFixed(2),
                "data3": "",
                "selected": false,
                "i": 36,
              },
            ];
            status = [
              {
                "CCP1": ccpData["CCP1_R"],
                "CCP2": ccpData["CCP2_R"],
                "CCP3": ccpData["CCP3_R"],
              },
              {
                "CCP1": ccpData["CCP_1WDSPDSD1S"],
                "CCP2": ccpData["CCP_2WDSPDSD1S"],
                "CCP3": ccpData["CCP_3WDSPDSD1S"], //CSS1
              },
              {
                "CCP1": ccpData["CCP_1WDSPDSD2S"],
                "CCP2": ccpData["CCP_2WDSPDSD2S"],
                "CCP3": ccpData["CCP_3WDSPDSD2S"], //CSS2
              },
              {
                "CCP1": ccpData["CCP_1WDSPDSD3S"],
                "CCP2": ccpData["CCP_2WDSPDSD3S"],
                "CCP3": ccpData["CCP_3WDSPDSD3S"], //CSS3
              },
              {
                "CCP1": ccpData["CCP_1WDSPDSD4S"],
                "CCP2": ccpData["CCP_2WDSPDSD4S"],
                "CCP3": ccpData["CCP_3WDSPDSD4S"], // #CSS4
              },
              {
                "CCP1": ccpData["CCP_1WDSPDSD5S"],
                "CCP2": ccpData["CCP_2WDSPDSD5S"], // #CSS5
              },
              {
                "CCP1": ccpData["CCP_1WDSPDSD6S"],
                "CCP2": ccpData["CCP_2WDSPDSD6S"], // #CSS6
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
                  padding: const EdgeInsets.only(left: 0),
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
                              vertical: 5, horizontal: 3),
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
                          decoration: BoxDecoration(
                            border: const Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 44, 129, 227),
                                width: 2.0,
                              ),
                            ),
                            color: status[0]["CCP1"] <= 0.0
                                ? myColors["deactive"]
                                : status[0]["CCP1"] >= 0.2 &&
                                        double.parse(rows[3]["data1"]) > 2
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("CCP1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: const Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 44, 129, 227),
                                width: 2.0,
                              ),
                            ),
                            color: status[0]["CCP2"] <= 0.0
                                ? myColors["deactive"]
                                : status[0]["CCP2"] >= 0.2 &&
                                        double.parse(rows[3]["data2"]) > 2
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("CCP2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: status[0]["CCP3"] <= 0.0
                                ? myColors["deactive"]
                                : status[0]["CCP3"] >= 0.2 &&
                                        double.parse(rows[3]["data3"]) > 2
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("CCP3",
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
                          color: const Color.fromARGB(
                              113, 44, 129, 227), // Border color
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
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: Text(
            h,
            style: TextStyle(color: color),
          ),
        ),
      ),
      i == 18 || i == 19 || i == 20 || i == 21 || i == 22 || i == 23
          ? Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            )
          : Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: const Border(
                    right: BorderSide(
                      color: Color.fromARGB(113, 44, 129, 227),
                      width: 2.0,
                    ),
                  ),
                  color: i == 4
                      ? status[1]["CCP1"] == "Casting"
                          ? myColors["active"]
                          : myColors["deactive"]
                      : i == 5
                          ? status[2]["CCP1"] == "Casting"
                              ? myColors["active"]
                              : myColors["deactive"]
                          : i == 6
                              ? status[3]["CCP1"] == "Casting"
                                  ? myColors["active"]
                                  : myColors["deactive"]
                              : i == 7
                                  ? status[4]["CCP1"] == "Casting"
                                      ? myColors["active"]
                                      : myColors["deactive"]
                                  : i == 8
                                      ? status[5]["CCP1"] == "Casting"
                                          ? myColors["active"]
                                          : myColors["deactive"]
                                      : i == 9
                                          ? status[6]["CCP1"] == "Casting"
                                              ? myColors["active"]
                                              : myColors["deactive"]
                                          : const Color.fromARGB(0, 255, 7, 7),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 18 || i == 19 || i == 20 || i == 21 || i == 22 || i == 23
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: const Border(
                    right: BorderSide(
                      color: Color.fromARGB(113, 44, 129, 227),
                      width: 2.0,
                    ),
                  ),
                  color: i == 4
                      ? status[1]["CCP2"] == "Casting"
                          ? myColors["active"]
                          : myColors["deactive"]
                      : i == 5
                          ? status[2]["CCP2"] == "Casting"
                              ? myColors["active"]
                              : myColors["deactive"]
                          : i == 6
                              ? status[3]["CCP2"] == "Casting"
                                  ? myColors["active"]
                                  : myColors["deactive"]
                              : i == 7
                                  ? status[4]["CCP2"] == "Casting"
                                      ? myColors["active"]
                                      : myColors["deactive"]
                                  : i == 8
                                      ? status[5]["CCP2"] == "Casting"
                                          ? myColors["active"]
                                          : myColors["deactive"]
                                      : i == 9
                                          ? status[6]["CCP2"] == "Casting"
                                              ? myColors["active"]
                                              : myColors["deactive"]
                                          : const Color.fromARGB(0, 255, 7, 7),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d2,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 18 || i == 19 || i == 20 || i == 21 || i == 22 || i == 23
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: i == 4
                      ? status[1]["CCP3"] == "Casting"
                          ? myColors["active"]
                          : myColors["deactive"]
                      : i == 5
                          ? status[2]["CCP3"] == "Casting"
                              ? myColors["active"]
                              : myColors["deactive"]
                          : i == 6
                              ? status[3]["CCP3"] == "Casting"
                                  ? myColors["active"]
                                  : myColors["deactive"]
                              : i == 7
                                  ? status[4]["CCP3"] == "Casting"
                                      ? myColors["active"]
                                      : myColors["deactive"]
                                  : const Color.fromARGB(0, 255, 7, 7),
                ),
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
