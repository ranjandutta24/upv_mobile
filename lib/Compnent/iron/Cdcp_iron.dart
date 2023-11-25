// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Cdcp extends StatefulWidget {
  const Cdcp({super.key});

  @override
  State<Cdcp> createState() {
    return CdcpState();
  }
}

class CdcpState extends State<Cdcp> {
  late dynamic cdcpData;
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
    cdcpserviceWrap();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      cdcpserviceWrap();
    });
  }

  List<dynamic> rows = [];

  cdcpserviceWrap() async {
    if (mounted) {
      await cdcpservice().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            cdcpData = json.decode(data.body);
            rows = [
              {
                "head": "Steam Flow[TPH]",
                "data1": cdcpData["BOILER1FIR523"].toStringAsFixed(2),
                "data2": cdcpData["BOILER2FIR523"].toStringAsFixed(2),
                "data3": cdcpData["BOILER3FIR523"].toStringAsFixed(2),
                "data4": cdcpData["BOILER4FIR523"].toStringAsFixed(2),
                "selected": false,
                "i": 0,
              },
              //"${bfshData["BF_ORE2"].toStringAsFixed(2)}",
              {
                "head": "Steam Pr [Kg/cm2]",
                "data1": cdcpData["BOILER1PI520"].toStringAsFixed(0),
                "data2": cdcpData["BOILER2PI520"].toStringAsFixed(0),
                "data3": cdcpData["BOILER3PI520"].toStringAsFixed(0),
                "data4": cdcpData["BOILER4PI520"].toStringAsFixed(0),
                "selected": false,
                "i": 1,
              },
              {
                "head": "Current. Shift Charge Count",
                "data1": cdcpData["LIFTER1CHARGINGQ1"].toStringAsFixed(0),
                "data2": cdcpData["LIFTER2CHARGINGQ1"].toStringAsFixed(0),
                "data3": cdcpData["LIFTER3CHARGINGQ1"].toStringAsFixed(0),
                "data4": cdcpData["LIFTER4CHARGINGQ1"].toStringAsFixed(0),
                "selected": false,
                "i": 1,
              },
              {
                "head": "Previous 1 Shift Charge Count",
                "data1": cdcpData["LIFTER1CHARGINGQ2"] == null
                    ? "0"
                    : cdcpData["LIFTER1CHARGINGQ2"].toStringAsFixed(0),
                "data2": cdcpData["LIFTER2CHARGINGQ2"] == null
                    ? "0"
                    : cdcpData["LIFTER2CHARGINGQ2"].toStringAsFixed(0),
                "data3": cdcpData["LIFTER3CHARGINGQ2"] == null
                    ? "0"
                    : cdcpData["LIFTER3CHARGINGQ2"].toStringAsFixed(0),
                "data4": cdcpData["LIFTER4CHARGINGQ2"] == null
                    ? "0"
                    : cdcpData["LIFTER4CHARGINGQ2"].toStringAsFixed(0),
                "selected": false,
                "i": 2,
              },

              {
                "head": "Next Previous 2 Shift Charge",
                "data1": cdcpData["LIFTER1CHARGINGQ3"] == null
                    ? "0"
                    : cdcpData["LIFTER1CHARGINGQ3"].toStringAsFixed(0),
                "data2": cdcpData["LIFTER2CHARGINGQ3"] == null
                    ? "0"
                    : cdcpData["LIFTER2CHARGINGQ3"].toStringAsFixed(0),
                "data3": cdcpData["LIFTER3CHARGINGQ3"] == null
                    ? "0"
                    : cdcpData["LIFTER3CHARGINGQ3"].toStringAsFixed(0),
                "data4": cdcpData["LIFTER4CHARGINGQ3"] == null
                    ? "0"
                    : cdcpData["LIFTER4CHARGINGQ3"].toStringAsFixed(0),
                "selected": false,
                "i": 2,
              },
              {
                "head": "Next Next Previous 3 Shift Charge",
                "data1": cdcpData["LIFTER1CHARGINGQ4"] == null
                    ? "0"
                    : cdcpData["LIFTER1CHARGINGQ4"].toStringAsFixed(0),
                "data2": cdcpData["LIFTER2CHARGINGQ4"] == null
                    ? "0"
                    : cdcpData["LIFTER2CHARGINGQ4"].toStringAsFixed(0),
                "data3": cdcpData["LIFTER3CHARGINGQ4"] == null
                    ? "0"
                    : cdcpData["LIFTER3CHARGINGQ4"].toStringAsFixed(0),
                "data4": cdcpData["LIFTER4CHARGINGQ4"] == null
                    ? "0"
                    : cdcpData["LIFTER4CHARGINGQ4"].toStringAsFixed(0),
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
      child: loading || !mounted
          ? const Text(" ")
          : Column(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        const Color.fromARGB(113, 44, 129, 227), // Border color
                    width: 2.0, // Border width
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
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
                            vertical: 8, horizontal: 0),
                        child: const Text(
                          "Production",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
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
                            vertical: 8, horizontal: 0),
                        child: const Text("CH#1",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
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
                            vertical: 8, horizontal: 0),
                        child: const Text("CH#2",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
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
                            vertical: 8, horizontal: 0),
                        child: const Text("CH#3",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
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
                            vertical: 8, horizontal: 0),
                        child: const Text("CH#4",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9,
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
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
            ]),
    );
  }
}

Widget _row(h, d1, d2, d3, d4, color, i) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Expanded(
      flex: 7,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Color.fromARGB(113, 44, 129, 227),
              width: 2.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: Text(
            h,
            style: TextStyle(color: color, fontSize: 12),
          ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: Text(
            d1,
            style: TextStyle(color: color, fontSize: 12),
            textAlign: TextAlign.center,
          ),
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
        child: Text(d2,
            style: TextStyle(color: color, fontSize: 12),
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
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Text(d3,
            style: TextStyle(color: color, fontSize: 12),
            textAlign: TextAlign.center),
      ),
    ),
    Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        child: Text(d4,
            style: TextStyle(color: color, fontSize: 12),
            textAlign: TextAlign.center),
      ),
    ),
  ]);
}
