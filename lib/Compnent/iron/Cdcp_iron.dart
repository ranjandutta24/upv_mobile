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
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      TechnoService();
    });
  }

  List<dynamic> rows = [];

  TechnoService() async {
    await cdcpservice().then((data) {
      if (mounted) {
        // print(data.body);
        setState(() {
          cdcpData = json.decode(data.body);
          rows = [
            {
              "head": "Steam Flow[TPH]",
              "data1": cdcpData["BOILER1FIR523"].toStringAsFixed(0),
              "data2": cdcpData["BOILER2FIR523"].toStringAsFixed(0),
              "data3": cdcpData["BOILER3FIR523"].toStringAsFixed(0),
              "data4": cdcpData["BOILER4FIR523"].toStringAsFixed(0),
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
              "head": "Next Previous 2 Shift Charge Count",
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
              "head": "Next Next Previous 3 Shift Charge Count",
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
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: loading
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
                            vertical: 8, horizontal: 0),
                        child: const Text(
                          "Production",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
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
                              fontSize: 11,
                              color: Color.fromARGB(255, 152, 152, 152),
                            ),
                            textAlign: TextAlign.right),
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
                              fontSize: 11,
                              color: Color.fromARGB(255, 152, 152, 152),
                            ),
                            textAlign: TextAlign.right),
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
                              fontSize: 11,
                              color: Color.fromARGB(255, 152, 152, 152),
                            ),
                            textAlign: TextAlign.right),
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
                              fontSize: 11,
                              color: Color.fromARGB(255, 152, 152, 152),
                            ),
                            textAlign: TextAlign.right),
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
                        color:
                            Color.fromARGB(113, 44, 129, 227), // Border color
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
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
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: Text(
            d1,
            style: TextStyle(color: color, fontSize: 14),
            textAlign: TextAlign.right,
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Text(d2,
            style: TextStyle(color: color, fontSize: 14),
            textAlign: TextAlign.right),
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
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Text(d3,
            style: TextStyle(color: color, fontSize: 14),
            textAlign: TextAlign.right),
      ),
    ),
    Expanded(
      flex: 1,
      child: Container(
        decoration: const BoxDecoration(),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        child: Text(d4,
            style: TextStyle(color: color, fontSize: 14),
            textAlign: TextAlign.right),
      ),
    ),
  ]);
}
