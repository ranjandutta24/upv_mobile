import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Bppi extends StatefulWidget {
  const Bppi({super.key});

  @override
  State<Bppi> createState() {
    return BppiState();
  }
}

class BppiState extends State<Bppi> {
  late dynamic bppiData;
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
    TechnoService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      TechnoService();
    });
  }

  List<dynamic> rows = [];

  TechnoService() async {
    await byproductplant().then((data) {
      if (mounted) {
        print(data.body);
        setState(() {
          bppiData = json.decode(data.body);
          rows = [
            {
              "head": "CO Gas Make [Nm3/hr]",
              "data1": bppiData["EX2"].toString(),
              "data2": bppiData["EX2"].toString(),
              "data3": bppiData["EX2"].toString(),
              "selected": false,
              "i": 0,
            },
            {
              "head": "CO Pressure [mmwc]",
              "data1": bppiData["EX2"].toString(),
              "data2": bppiData["EX2"].toString(),
              "data3": bppiData["EX2"].toString(),
              "selected": false,
              "i": 1,
            },
            {
              "head": "Flare Stack Flow [Nm3/hr]",
              "data1": bppiData["EX2"].toString(),
              "data2": bppiData["EX2"].toString(),
              "data3": bppiData["EX2"].toString(),
              "selected": false,
              "i": 2,
            },
            {
              "head": "Flare Stack Pressure [mmwc]",
              "data1": bppiData["EX2"].toString(),
              "data2": bppiData["EX2"].toString(),
              "data3": bppiData["EX2"].toString(),
              "selected": false,
              "i": 3,
            },
            {
              "head": "Exhauster BPP 11",
              "data1": bppiData["EX2"].toString(),
              "data2": bppiData["EX2"].toString(),
              "data3": bppiData["EX2"].toString(),
              "selected": false,
              "i": 4,
            },
            {
              "head": "Exhauster BPP 10",
              "data1": bppiData["EX2"].toString(),
              "data2": bppiData["EX2"].toString(),
              "data3": bppiData["EX2"].toString(),
              "selected": false,
              "i": 5,
            },
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: loading
          ? const Text(" ")
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(113, 43, 76, 98),
                      width: 2.0,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Color.fromARGB(113, 74, 104, 156),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            child: const Text('Parameters',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Color.fromARGB(113, 56, 104, 156),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            child: const Text("BPP11",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 152, 152, 152),
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            child: const Text("BPP10",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 152, 152, 152),
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                      ]),
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
        flex: 6,
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
              style: TextStyle(color: color), textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d2,
              style: TextStyle(color: color), textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
