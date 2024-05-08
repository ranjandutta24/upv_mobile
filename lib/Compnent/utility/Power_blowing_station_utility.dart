// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class PbsUt extends StatefulWidget {
  const PbsUt({super.key});

  @override
  State<PbsUt> createState() {
    return PbsUtState();
  }
}

class PbsUtState extends State<PbsUt> {
  late dynamic pbsData;
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
    pbsService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      pbsService();
    });
  }

  List<dynamic> rows = [];
  List<dynamic> rows2 = [];
  List<dynamic> rows3 = [];
  List<dynamic> rows4 = [];

  pbsService() async {
    if (mounted) {
      // print("call");
      await powerblowingstation().then((data) {
        if (mounted) {
          print(data.body);
          setState(() {
            pbsData = json.decode(data.body);
            rows = [
              {
                "head": "Steam Flow [TPH]",
                "data1": pbsData["PBS_B1MSF"] == null
                    ? "0"
                    : pbsData["PBS_B1MSF"].toString(),
                "data2": pbsData["PBS_B2MSF"] == null
                    ? "0"
                    : pbsData["PBS_B2MSF"].toString(),
                "data3": pbsData["PBS_B3MSF"].toString(),
                "selected": false,
                "i": 0,
              },
              {
                "head": "BFG FLOW [Nm3/hr]",
                "data1": pbsData["PBS_B1BFGF"] == null
                    ? "0"
                    : pbsData["PBS_B1BFGF"].toString(),
                "data2": pbsData["PBS_B2BFGF"] == null
                    ? "0"
                    : pbsData["PBS_B2BFGF"].toString(),
                "data3": pbsData["PBS_B3BFGF"] == null
                    ? "0"
                    : pbsData["PBS_B3BFGF"].toString(),
                "selected": false,
                "i": 1,
              },
              {
                "head": "COG FLOW [Nm3/hr]",
                "data1": pbsData["PBS_B1COGF"] == null
                    ? "0"
                    : pbsData["PBS_B1COGF"].toString(),
                "data2": pbsData["PBS_B2COGF"] == null
                    ? "0"
                    : pbsData["PBS_B2COGF"].toString(),
                "data3": pbsData["PBS_B3COGF"] == null
                    ? "0"
                    : pbsData["PBS_B3COGF"].toString(),
                "selected": false,
                "i": 2,
              },
              {
                "head": "CBM FLOW [Nm3/hr]",
                "data1": pbsData["PBS_B1CBMF"] == null
                    ? "0"
                    : pbsData["PBS_B1CBMF"].toString(),
                "data2": pbsData["PBS_B2CBMF"] == null
                    ? "0"
                    : pbsData["PBS_B2CBMF"].toString(),
                "data3": pbsData["PBS_B3CBMF"] == null
                    ? "0"
                    : pbsData["PBS_B3CBMF"].toString(),
                "selected": false,
                "i": 3,
              },
              {
                "head": "Steam Pressure [Kg/cm2]",
                "data1": pbsData["PBS_B1MSP"] == null
                    ? "0"
                    : pbsData["PBS_B1MSP"].toString(),
                "data2": pbsData["PBS_B2MSP"] == null
                    ? "0"
                    : pbsData["PBS_B2MSP"].toString(),
                "data3": pbsData["PBS_B3MSP"] == null
                    ? "0"
                    : pbsData["PBS_B3MSP"].toString(),
                "selected": false,
                "i": 4,
              },
              {
                "head": "Steam Temp.[Degc]",
                "data1": pbsData["PBS_B1MST"] == null
                    ? "0"
                    : pbsData["PBS_B1MST"].toString(),
                "data2": pbsData["PBS_B2MST"] == null
                    ? "0"
                    : pbsData["PBS_B2MST"].toString(),
                "data3": pbsData["PBS_B3MST"] == null
                    ? "0"
                    : pbsData["PBS_B3MST"].toString(),
                "selected": false,
                "i": 5,
              }
            ];
            rows2 = [
              {
                "head": "Generation [MW]",
                "data1": pbsData["PBS_STG1GEN"] == null
                    ? "0"
                    : pbsData["PBS_STG1GEN"].toStringAsFixed(2),
                "data2": pbsData["PBS_STG2GEN"] == null
                    ? "0"
                    : pbsData["PBS_STG2GEN"].toStringAsFixed(2),
                "data3": pbsData["PBS_STG3GEN"] == null
                    ? "0"
                    : pbsData["PBS_STG3GEN"].toStringAsFixed(2),
                "selected": false,
                "i": 4,
              },
              {
                "head": "Steam Flow [TPH]",
                "data1": pbsData["PBS_STG1SF"] == null
                    ? "0"
                    : pbsData["PBS_STG1SF"].toStringAsFixed(2),
                "data2": pbsData["PBS_STG2SF"] == null
                    ? "0"
                    : pbsData["PBS_STG2SF"].toStringAsFixed(2),
                "data3": pbsData["PBS_STG3SF"] == null
                    ? "0"
                    : pbsData["PBS_STG3SF"].toStringAsFixed(2),
                "selected": false,
                "i": 5,
              },
            ];
            rows3 = [
              {
                "head": "Discharge [Nm3/min]",
                "data1": pbsData["PBS_BL1DF"] == null
                    ? "0"
                    : pbsData["PBS_BL1DF"].toStringAsFixed(2),
                "data2": pbsData["PBS_BL2DF"] == null
                    ? "0"
                    : pbsData["PBS_BL2DF"].toStringAsFixed(2),
                "data3": pbsData["PBS_BL3DF"] == null
                    ? "0"
                    : pbsData["PBS_BL3DF"].toStringAsFixed(2),
                "selected": false,
                "i": 6,
              },
              {
                "head": "Steam Flow [TPH]",
                "data1": pbsData["PBS_STB1SF"] == null
                    ? "0"
                    : pbsData["PBS_STB1SF"].toStringAsFixed(2),
                "data2": pbsData["PBS_STB2SF"] == null
                    ? "0"
                    : pbsData["PBS_STB2SF"].toStringAsFixed(2),
                "data3": pbsData["PBS_STB3SF"] == null
                    ? "0"
                    : pbsData["PBS_STB3SF"].toStringAsFixed(2),
                "selected": false,
                "i": 7,
              },
            ];
            rows4 = [
              {
                "head": "Generation [MW]",
                "data1": pbsData["PBS_BPTGEN"] == null
                    ? "0"
                    : pbsData["PBS_BPTGEN"].toStringAsFixed(2),
                "data2": pbsData["BF_TRTGMW"] == null
                    ? "0"
                    : pbsData["BF_TRTGMW"].toStringAsFixed(2),
                "data3": "",
                "selected": false,
                "i": 8,
              },
            ];
            if (num != -1) {
              rows[num]["selected"] = true;
              // rows2[num]["selected"] = true;
            }
            loading = false;
          });
        } else {
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
                    color: borderColor,
                    width: 2.0,
                  )),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 4,
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
                            child: Text('Parameter',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: borderColor,
                                  fontSize: 11,
                                )),
                          )),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows[0]["data1"]) <= 10
                                ? myColors["deactive"]
                                : double.parse(rows[0]["data1"]) > 10
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("BOILER1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),

                            // *error
                            color: rows[0]["data2"] == "null"
                                ? myColors["deactive"]
                                : double.parse(rows[0]["data2"]) <= 10
                                    ? myColors["deactive"]
                                    : double.parse(rows[0]["data2"]) > 10
                                        ? myColors["active"]
                                        : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("BOILER2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                              color: double.parse(rows[0]["data3"]) <= 10
                                  ? myColors["deactive"]
                                  : double.parse(rows[0]["data3"]) > 10
                                      ? myColors["active"]
                                      : const Color.fromARGB(0, 255, 193, 7)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("BOILER3",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
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
                          width: 1.0,
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor,
                      width: 2.0,
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
                              color: borderColor,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows2[0]["data1"]) <= 1
                                ? myColors["deactive"]
                                : double.parse(rows2[0]["data1"]) > 3
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("STG1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows2[0]["data2"]) <= 1
                                ? myColors["deactive"]
                                : double.parse(rows2[0]["data2"]) > 3
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("STG2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: double.parse(rows2[0]["data3"]) <= 1
                                ? myColors["deactive"]
                                : double.parse(rows2[0]["data3"]) > 3
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("STG3",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                for (final Map r in rows2)
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
                          width: 1.0,
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor,
                      width: 2.0,
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
                              color: borderColor,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: const Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 56, 104, 156),
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows3[0]["data1"]) <= 300
                                ? myColors["deactive"]
                                : double.parse(rows3[0]["data1"]) > 300
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("STB1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows3[0]["data2"]) <= 300
                                ? myColors["deactive"]
                                : double.parse(rows3[0]["data2"]) > 300
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("STB2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: double.parse(rows3[0]["data3"]) <= 300
                                ? myColors["deactive"]
                                : double.parse(rows3[0]["data3"]) > 300
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("STB3",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                for (final Map r in rows3)
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
                          width: 1.0,
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor,
                      width: 2.0,
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
                              color: borderColor,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows4[0]["data1"]) < 1
                                ? myColors["deactive"]
                                : myColors["active"],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("BPTG1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows4[0]["data2"]) < 0.1
                                ? myColors["deactive"]
                                : myColors["active"],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("TRTG",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
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
                          child: const Text("",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152),
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
                for (final Map r in rows4)
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
                          width: 1.0,
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
            style: TextStyle(
                color: color, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Expanded(
        flex: 2,
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
                  color: color, fontSize: 11, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 2,
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
                  color: color, fontSize: 11, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d3,
              style: TextStyle(
                  color: color, fontSize: 11, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
