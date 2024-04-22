// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class Stoves extends StatefulWidget {
  const Stoves({super.key});

  @override
  State<Stoves> createState() {
    return StovesState();
  }
}

class StovesState extends State<Stoves> {
  late dynamic stovesData;
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

  List<dynamic> rows = [];

  fun() {
    stoveserviceWraper();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      stoveserviceWraper();
    });
  }

  stoveserviceWraper() async {
    if (mounted) {
      await stoveservice().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            stovesData = json.decode(data.body);
            rows = [
              {
                "head": "Stv 1 Gas Flow [Nm3/hr]",
                "data1": stovesData["SMG1"].toStringAsFixed(0),
                "selected": false,
                "i": 0,
              },
              {
                "head": "Stv 1 Dome Temp. [DegC]",
                "data1": stovesData["SDT1"].toStringAsFixed(0),
                "selected": false,
                "i": 1,
              },
              {
                "head": "Stv 2 Gas Flow [Nm3/hr]",
                "data1": stovesData["SMG2"].toStringAsFixed(0),
                "selected": false,
                "i": 2,
              },
              {
                "head": "Stv 2 Dome Temp. [DegC]",
                "data1": stovesData["SDT2"].toStringAsFixed(0),
                "selected": false,
                "i": 3,
              },
              {
                "head": "Stv 3 Gas Flow [Nm3/hr]",
                "data1": stovesData["SMG3"].toStringAsFixed(0),
                "selected": false,
                "i": 4,
              },
              {
                "head": "Stv 3 Dome Temp.[DegC]",
                "data1": stovesData["SDT3"].toStringAsFixed(0),
                "selected": false,
                "i": 5,
              },
              {
                "head": "BF Gas Total Cons[Nm3/hr]",
                "data1": stovesData["TOTAL_BF_CONSUMPTION"].toStringAsFixed(0),
                "selected": false,
                "i": 6,
              },
              {
                "head": "Snort Position [%]",
                "data1": stovesData["PBS_SNORT"].toStringAsFixed(2),
                "selected": false,
                "i": 7,
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
                    color: borderColor, // Border color
                    width: 2.0, // Border width
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(238, 205, 205, 205),
                          border: Border(
                            right: BorderSide(
                              color: borderColor,
                              width: 3.0,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 3),
                        child: Text(
                          "Parameters",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: borderColor),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(238, 205, 205, 205),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 3),
                        child: Text(
                          "Value",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: borderColor,
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
                        color: borderColor, // Border color
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
        flex: 7,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Text(
              h,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Text(
              d1,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ],
  );
}
