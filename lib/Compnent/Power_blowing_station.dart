import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Pbs extends StatefulWidget {
  const Pbs({super.key});

  State<Pbs> createState() {
    return PbsState();
  }
}

class PbsState extends State<Pbs> {
  late dynamic pbsData;
  var loading = true;
  @override
  void initState() {
    super.initState();
    fun();
  }

  Color _containerColor = const Color.fromARGB(255, 17, 156, 43);
  Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  Color _textColor = const Color.fromARGB(255, 44, 44, 44);

  fun() {
    TechnoService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      TechnoService();
    });
  }

  List<dynamic> rows = [];

  TechnoService() async {
    await powerblowingstation().then((data) {
      if (mounted) {
        print(data.body);
        setState(() {
          pbsData = json.decode(data.body);
          rows = [
            {
              "head": "Steam Flow [TPH]",
              "data1": pbsData["PBS_B1MSP"].toString(),
              "data2": pbsData["PBS_B1MSP"].toString(),
              "data3": pbsData["PBS_B1MSP"].toString(),
              "selected": false,
              "i": 1,
            },
            // {
            //   "head": "BFG FLOW [Nm3/hr]",
            //   "data1": pbsData["STEAMFLOW1"].toString(),
            //   "data2": pbsData["STEAMFLOW2"].toString(),
            //   "data3": pbsData["STEAMFLOW3"].toString(),
            //   "selected": false,
            //   "i": 1,
            // },
            // {
            //   "head": "COG FLOW [Nm3/hr]",
            //   "data1": pbsData["STEAMFLOW1"].toString(),
            //   "data2": pbsData["STEAMFLOW2"].toString(),
            //   "data3": pbsData["STEAMFLOW3"].toString(),
            //   "selected": false,
            //   "i": 1,
            // },
            // {
            //   "head": "CBM FLOW [Nm3/hr]",
            //   "data1": pbsData["STEAMFLOW1"].toString(),
            //   "data2": pbsData["STEAMFLOW2"].toString(),
            //   "data3": pbsData["STEAMFLOW3"].toString(),
            //   "selected": false,
            //   "i": 1,
            // }
          ];
        });
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
                    )),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 4,
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
                              child: const Text('Parameter',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  )),
                            )),
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
                            child: const Text("BOILER1",
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
                            child: const Text("BOILER2",
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
                            child: const Text("BOILER3",
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
                        onTap: () {},
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
                              r["data3"],
                              r["selected"] == true
                                  ? _containerColora
                                  : _textColor,
                              r["i"]),
                        ))
                ],
              ));
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
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d1,
              style: TextStyle(color: color), textAlign: TextAlign.center),
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
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d2,
              style: TextStyle(color: color), textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d3,
              style: TextStyle(color: color), textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
