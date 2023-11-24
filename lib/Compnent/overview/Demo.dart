// import 'dart:async';
// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class Demo extends StatefulWidget {
  const Demo({super.key});
  @override
  State<Demo> createState() {
    return DemoState();
  }
}

class DemoState extends State<Demo> {
  late dynamic ccpData;
  var loading = true;
  var num = -1;
  @override
  void initState() {
    super.initState();
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

  List<dynamic> rows = [];
  List<dynamic> status = [];

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
      i == 10
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
      i == 10
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
      i == 10
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
