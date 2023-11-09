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
  late dynamic blastData;
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
        // print(data.body);
        setState(() {
          blastData = json.decode(data.body);
          rows = [
            {
              "head": "Heat A/B/C",
              "data1": "12",
              "data2": "dd",
              "data3": "2e",
              "selected": false,
              "i": 0,
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
