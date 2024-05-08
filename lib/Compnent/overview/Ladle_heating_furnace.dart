// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class Lhf extends StatefulWidget {
  const Lhf({super.key});

  @override
  State<Lhf> createState() {
    return LhfState();
  }
}

class LhfState extends State<Lhf> {
  late dynamic lhfData;
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
      ladleheatingfurnaceService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        ladleheatingfurnaceService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> state = [];

  ladleheatingfurnaceService() async {
    if (mounted) {
      await ladleheatingfurnace().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            lhfData = json.decode(data.body);
            rows = [
              {
                "head": "Temp [DegC]",
                "data1":
                    "${lhfData["LF1_TEMP1"].toString()}/${lhfData["LF1_TEMP2"].toString()}/${lhfData["LF1_TEMP3"].toString()}",
                "data2":
                    "${lhfData["LF2_TEMP1"].toString()}/${lhfData["LF2_TEMP2"].toString()}/${lhfData["LF2_TEMP3"].toString()}",
                "selected": false,
                "i": 0,
              },
              {
                "head": "CaSi/Fe Wire Spd SP/Act",
                "data1":
                    "${lhfData["SPACTSPD1"] == null ? '0' : lhfData["SPACTSPD1"].toString()}/${lhfData["ACTSPD1"] == null ? '0' : lhfData["ACTSPD1"].toString()}",
                "data2":
                    "${lhfData["SPACTSPD3"] == null ? '0' : lhfData["SPACTSPD3"].toString()}/${lhfData["ACTSPD3"] == null ? '0' : lhfData["ACTSPD3"].toString()}",
                "selected": false,
                "i": 1,
              },
              {
                "head": "CaSi/Fe Wire Lth SP/Act",
                "data1":
                    "${lhfData["SPACTLENGTH1"] == null ? '0' : lhfData["SPACTLENGTH1"].toString()}/${lhfData["ACTLENGTH1"] == null ? '0' : lhfData["ACTLENGTH1"].toString()}",
                "data2":
                    "${lhfData["SPACTLENGTH3"] == null ? '0' : lhfData["SPACTLENGTH3"].toString()}/${lhfData["ACTLENGTH3"] == null ? '0' : lhfData["ACTLENGTH3"].toString()}",
                "selected": false,
                "i": 2,
              },
              {
                "head": "CaSi/Fe Wire Wt SP/Act ",
                "data1":
                    "${lhfData["SPACTWT1"] == null ? '0' : lhfData["SPACTWT1"].toString()}/${lhfData["ACTWT1"] == null ? '0' : lhfData["ACTWT1"].toString()}",
                "data2":
                    "${lhfData["SPACTWT3"] == null ? '0' : lhfData["SPACTWT3"].toString()}/${lhfData["ACTWT3"] == null ? '0' : lhfData["ACTWT3"].toString()}",
                "selected": false,
                "i": 3,
              },
              {
                "head": "Al Wire Spd SP/Act ",
                "data1":
                    "${lhfData["SPACTSPD2"] == null ? '0' : lhfData["SPACTSPD2"].toString()}/${lhfData["ACTSPD2"] == null ? '0' : lhfData["ACTSPD2"].toString()}",
                "data2":
                    "${lhfData["SPACTSPD4"] == null ? '0' : lhfData["SPACTSPD4"].toString()}/${lhfData["ACTSPD4"] == null ? '0' : lhfData["ACTSPD4"].toString()}",
                "selected": false,
                "i": 4,
              },
              {
                "head": "Al Wire SP/Act ",
                "data1":
                    "${lhfData["SPACTLENGTH2"] == null ? '0' : lhfData["SPACTLENGTH2"].toString()}/${lhfData["ACTLENGTH2"] == null ? '0' : lhfData["ACTLENGTH2"].toString()}",
                "data2":
                    "${lhfData["SPACTLENGTH4"] == null ? '0' : lhfData["SPACTLENGTH4"].toString()}/${lhfData["ACTLENGTH4"] == null ? '0' : lhfData["ACTLENGTH4"].toString()}",
                "selected": false,
                "i": 5,
              },
              {
                "head": "Al Wire Wt SP/Act ",
                "data1":
                    "${lhfData["SPACTWT2"] == null ? '0' : lhfData["SPACTWT2"].toString()}/${lhfData["ACTWT2"] == null ? '0' : lhfData["ACTWT2"].toString()}",
                "data2":
                    "${lhfData["SPACTWT4"] == null ? '0' : lhfData["SPACTWT4"].toString()}/${lhfData["ACTWT4"] == null ? '0' : lhfData["ACTWT4"].toString()}",
                "selected": false,
                "i": 6,
              },
            ];
            state = [
              {"data1": lhfData["LF1_I1"], "data2": lhfData["LF2_I1"]}
            ];
            if (num != -1) {
              rows[num]["selected"] = true;
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
                          flex: 10,
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
                            child: Text('Parameters',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: borderColor,
                                )),
                          )),
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
                            color: state[0]["data1"] <= 0.1
                                ? myColors["deactive"]
                                : state[0]["data1"] >= 1.0
                                    ? myColors["active"]
                                    : borderColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("LF1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: state[0]["data2"] <= 0.1
                                ? myColors["deactive"]
                                : state[0]["data2"] >= 1.0
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("LF2",
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
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 3),
                      child: _row(
                          r["head"],
                          r["data1"],
                          r["data2"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 10,
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
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(
            h,
            style: TextStyle(
                color: color, fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ),
      ),
      Expanded(
        flex: 4,
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
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d1,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.w600, fontSize: 12),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 4,
        child: Container(
          height: 46,
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d2,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.w600, fontSize: 12),
              textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
