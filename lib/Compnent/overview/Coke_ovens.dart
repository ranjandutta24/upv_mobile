// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

class CokeOvens extends StatefulWidget {
  const CokeOvens({super.key});
  @override
  State<CokeOvens> createState() {
    return CokeOvensState();
  }
}

class CokeOvensState extends State<CokeOvens> {
  late dynamic cokeOvensData;
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
      cokeovensService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        cokeovensService();
      });
    }
  }

  List<dynamic> rows = [];

  cokeovensService() async {
    if (mounted) {
      await cokeovens().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            cokeOvensData = json.decode(data.body);
            rows = [
              {
                "head": "A Shift",
                "data1": cokeOvensData["COB11_PUSHA"].toString(),
                "data2": cokeOvensData["COB11_CHARGEA"].toString(),
                "data3": cokeOvensData["COB10_PUSHA"].toString(),
                "data4": cokeOvensData["COB10_CHARGEA"].toString(),
                "selected": false,
                "i": 0,
              },
              {
                "head": "B Shift",
                "data1": cokeOvensData["COB11_PUSHB"].toString(),
                "data2": cokeOvensData["COB11_CHARGEB"].toString(),
                "data3": cokeOvensData["COB10_PUSHB"].toString(),
                "data4": cokeOvensData["COB10_CHARGEB"].toString(),
                "selected": false,
                "i": 1,
              },
              {
                "head": "C Shift",
                "data1": cokeOvensData["COB11_PUSHC"].toString(),
                "data2": cokeOvensData["COB11_CHARGEC"].toString(),
                "data3": cokeOvensData["COB10_PUSHC"].toString(),
                "data4": cokeOvensData["COB10_CHARGEC"].toString(),
                "selected": false,
                "i": 2,
              },
              {
                "head": "Total",
                "data1": cokeOvensData["COB11_PUSHTOT"].toString(),
                "data2": cokeOvensData["COB11_CHARGETOT"].toString(),
                "data3": cokeOvensData["COB10_PUSHTOT"].toString(),
                "data4": cokeOvensData["COB10_CHARGETOT"].toString(),
                "selected": false,
                "i": 3,
              },
              {
                "head": "Prev.Day Total",
                "data1": cokeOvensData["PUSHING_TOTOLD"].toString(),
                "data2": cokeOvensData["CHARGING_TOTOLD"].toString(),
                "data3": cokeOvensData["COB10_PUSHTOTLD"].toString(),
                "data4": cokeOvensData["COB10_CHARGETOTLD"].toString(),
                "selected": false,
                "i": 4,
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
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 9, horizontal: 3),
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
                          decoration: BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                            border: Border(
                              left: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("Pushing COB11",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
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
                              vertical: 5, horizontal: 0),
                          child: Text("Charging COB11",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
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
                              vertical: 5, horizontal: 0),
                          child: Text("Pushing COB10",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: borderColor,
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
                          child: Text("Charging COB10",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
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
                          r["data2"],
                          r["data3"],
                          r["data4"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, d3, d4, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 4,
        child: Container(
          decoration: const BoxDecoration(),
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
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
              left: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d1,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
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
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
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
          child: Text(d3,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d4,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
