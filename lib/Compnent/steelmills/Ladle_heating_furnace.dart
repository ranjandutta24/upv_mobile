// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class Lhfsm extends StatefulWidget {
  const Lhfsm({super.key});

  @override
  State<Lhfsm> createState() {
    return LhfsmState();
  }
}

class LhfsmState extends State<Lhfsm> {
  late dynamic lhfData;
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
    if (mounted) {
      lfService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        lfService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> state = [];

  lfService() async {
    if (mounted) {
      await ladleheatingfurnace().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            lhfData = json.decode(data.body);
            rows = [
              {
                "head": "Temp [DegC]",
                "data1":
                    "${lhfData["LF1_TEMP1"].toString()}/${lhfData["LF1_TEMP2"].toString()}/${lhfData["LF1_TEMP3"].toString()}",
                "data2":
                    "${lhfData["LF2_TEMP1"].toString()}/${lhfData["LF2_TEMP2"].toString()}/${lhfData["LF2_TEMP3"].toString()}",
                "selected": false,
                "i": 0,
              },
              {
                "head": "Current [Amp]",
                "data1":
                    "${lhfData["LF1_I1"].toStringAsFixed(1)}/${lhfData["LF1_I2"].toStringAsFixed(1)}/${lhfData["LF1_I3"].toStringAsFixed(1)}",
                "data2":
                    "${lhfData["LF2_I1"].toStringAsFixed(1)}/${lhfData["LF2_I2"].toStringAsFixed(1)}/${lhfData["LF2_I3"].toStringAsFixed(1)}",
                "selected": false,
                "i": 1,
              },
            ];
            state = [
              {"data1": lhfData["LF1_I1"], "data2": lhfData["LF2_I1"]}
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
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 10,
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
                          )),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            border: const Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 56, 104, 156),
                                width: 2.0,
                              ),
                            ),
                            color: state[0]["data1"] <= 0.1
                                ? myColors["deactive"]
                                : state[0]["data1"] >= 1.0
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("LF1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: myColors["header"],
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: state[0]["data2"] <= 0.1
                                ? myColors["deactive"]
                                : state[0]["data2"] >= 1.0
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 255, 193, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("LF2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: myColors["header"],
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
        flex: 10,
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
        flex: 8,
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
        flex: 8,
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
