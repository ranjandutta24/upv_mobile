// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Gcp extends StatefulWidget {
  const Gcp({super.key});

  @override
  State<Gcp> createState() {
    return GcpState();
  }
}

class GcpState extends State<Gcp> {
  late dynamic gcpData;
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

  List<dynamic> rows = [];

  fun() {
    gcpserviceWraper();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      gcpserviceWraper();
    });
  }

  gcpserviceWraper() async {
    if (mounted) {
      await gcpservice().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            gcpData = json.decode(data.body);
            rows = [
              {
                "head": "TRTG Generation [MW]",
                "data1": gcpData["TRTGMW"].toStringAsFixed(0),
                "selected": false,
                "i": 0,
              },
              {
                "head": "TRTG Pressure[Kg/cm2]",
                "data1": gcpData["TRTPRES"].toStringAsFixed(0),
                "selected": false,
                "i": 1,
              },
              {
                "head": "TRTG Temp. [DegC]",
                "data1": gcpData["TRTTEMP"].toStringAsFixed(0),
                "selected": false,
                "i": 2,
              },
              {
                "head": "TRTG Open [%]",
                "data1": gcpData["TRTOPEN"].toStringAsFixed(2),
                "selected": false,
                "i": 3,
              },
              {
                "head": "AG Element A/B/C[%]",
                "data1":
                    "${gcpData["AG_A"].toStringAsFixed(2)}/${gcpData["AG_B"].toStringAsFixed(2)}/${gcpData["AG_C"].toStringAsFixed(2)}",
                "selected": false,
                "i": 4,
              },
              {
                "head": "Clean Gas flow High[Nm3/h]",
                "data1": gcpData["CLEAN_GAS_FLOW"].toStringAsFixed(0),
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: const Text(
                          "Parameters",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 152, 152, 152)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: const Text(
                          "Value",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 152, 152, 152),
                          ),
                          textAlign: TextAlign.center,
                        ),
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
                        r["selected"] == true ? _containerColora : _textColor,
                        r["i"]),
                  ),
                ),
            ]),
    );
  }
}

Widget _row(h, d1, color, i) {
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
        flex: 4,
        child: Container(
          decoration: const BoxDecoration(),
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
    ],
  );
}
