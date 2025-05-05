// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

class wmd extends StatefulWidget {
  const wmd({super.key});

  @override
  State<wmd> createState() {
    return wmdState();
  }
}

class wmdState extends State<wmd> {
  late dynamic bfshData;
  var loading = true;
  var num = -1;

  @override
  void initState() {
    super.initState();
    fun();
  }

  final Color _containerColor = const Color.fromARGB(255, 17, 156, 43);
  final Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  final Color _textColor = const Color.fromARGB(255, 0, 0, 0);

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
    bfstockhouseService();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      bfstockhouseService();
    });
  }

  List<dynamic> rows = [];

  bfstockhouseService() async {
    if (mounted) {
      await wmdpumphouse().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            bfshData = json.decode(data.body);
            rows = [
              {
                "head": "Pump 1",
                "data": "${bfshData["pump1_running"].toStringAsFixed(2)}",
                "selected": false,
                "i": 0,
              },
              {
                "head": "Pump 2",
                "data": "${bfshData["pump2_running"].toStringAsFixed(2)}",
                "selected": false,
                "i": 1,
              },
              {
                "head": "Pump 3",
                "data": "${bfshData["pump3_running"].toStringAsFixed(2)}",
                "selected": false,
                "i": 2,
              },
              {
                "head": "Pump 4",
                "data": "${bfshData["pump4_running"].toStringAsFixed(2)}",
                "selected": false,
                "i": 3,
              },
              {
                "head": "Pump 5",
                "data": "${bfshData["pump5_running"].toStringAsFixed(2)}",
                "selected": false,
                "i": 4,
              },
              {
                "head": "Total Flow [Nm3/hr]",
                "data": "${bfshData["totalflow"].toStringAsFixed(2)}",
                "selected": false,
                "i": 5,
              },
              {
                "head": "Main Header Pressure [kg/cm2]",
                "data": "${bfshData["mainheader_pressure"].toStringAsFixed(2)}",
                "selected": false,
                "i": 6,
              },
              {
                "head": "Settling Tanklevel [Meter]",
                "data": "${bfshData["settling_tanklevel"].toStringAsFixed(2)}",
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
                              width: 2.0,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 3),
                        child: Text(
                          "Riverside Pumphouse(3) Parameter",
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
                            vertical: 5, horizontal: 0),
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
                    padding: const EdgeInsets.only(left: 3, top: 0),
                    child: _row(
                        r["head"],
                        r["data"],
                        r["selected"] == true ? _containerColora : _textColor,
                        r["i"]),
                  ),
                ),
            ]),
    );
  }
}

Widget _row(
  h,
  d,
  color,
  i,
) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
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
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Container(
            // height: 46,
            decoration: BoxDecoration(
              color: i == 1 || i == 0 || i == 2 || i == 3 || i == 4
                  ? d == "1.00"
                      ? myColors["active"]
                      : myColors["deactive"]
                  : const Color.fromARGB(0, 255, 7, 7),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: Text(
                i == 1 || i == 0 || i == 2 || i == 3 || i == 4
                    ? d == "1.00"
                        ? "Running"
                        : "Stop"
                    : d,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
          ),

          //  Text(
          //   d,
          //   style: TextStyle(color: color, fontWeight: FontWeight.w600),
          //   textAlign: TextAlign.center,
          // ),
        ),
      ),
    ),
  ]);
}
