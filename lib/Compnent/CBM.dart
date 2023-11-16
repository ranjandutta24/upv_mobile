import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Cbm extends StatefulWidget {
  const Cbm({super.key});
  @override
  State<Cbm> createState() {
    return CbmState();
  }
}

class CbmState extends State<Cbm> {
  late dynamic cbmData;
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
    cbmService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      cbmService();
    });
  }

  List<dynamic> rows = [];

  cbmService() async {
    await cbm().then((data) {
      if (mounted) {
        print(data.body);
        setState(() {
          cbmData = json.decode(data.body);
          rows = [
            {
              "head": "METER 1 FLOW [SCM/hr]",
              "data1": cbmData["M1FLOW"].toString(),
              "selected": false,
              "i": 0,
            },
            {
              "head": "METER 2 FLOW [SCM/hr]",
              "data1": cbmData["M2FLOW"].toStringAsFixed(2),
              "data2": "",
              "selected": false,
              "i": 1,
            },
            {
              "head": "INLET PRESSURE [kg/cm2]",
              "data1": cbmData["INLETPRESSURE"].toStringAsFixed(2),
              "data2": "",
              "selected": false,
              "i": 2,
            },
            {
              "head": "OUTLET PRESSURE [kg/cm2]",
              "data1": cbmData["OUTLETPRESSURE"].toStringAsFixed(2),
              "data2": "",
              "selected": false,
              "i": 3,
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
                        flex: 2,
                        child: Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("Value",
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
      Expanded(
        flex: 2,
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d1,
              style: TextStyle(color: color), textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
