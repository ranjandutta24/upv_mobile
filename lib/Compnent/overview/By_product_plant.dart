// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

class Bpplant extends StatefulWidget {
  const Bpplant({super.key});

  @override
  State<Bpplant> createState() {
    return BpplantState();
  }
}

class BpplantState extends State<Bpplant> {
  late dynamic bpplantData;
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

  fun() {
    if (mounted) {
      byproductplantService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        byproductplantService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> state = [];

  byproductplantService() async {
    if (!mounted) return;
    try {
      final data = await byproductplant();

      if (data != null && mounted) {
        // print(data.body);
        setState(() {
          bpplantData = json.decode(data.body);
          rows = [
            {
              "head": "CO Gas Make [Nm3/hr]",
              "data1": bpplantData["FT0600F003_C"].toStringAsFixed(0),
              "data2": bpplantData["COB10_GASMAKEF"].toStringAsFixed(0),
              "selected": false,
              "i": 0,
            },
            {
              "head": "Exhauster BPP 11",
              "data1": "EX#1",
              "data2": "EX#2",
              "selected": false,
              "i": 1,
            },
            {
              "head": "Exhauster BPP 10",
              "data1": "EX#3",
              "data2": "EX#4",
              "selected": false,
              "i": 2,
            },
          ];
          state = [
            {
              "d1": bpplantData["EX1"],
              "d2": bpplantData["EX2"],
            },
            {
              "d1": bpplantData["BPP_EX3ON"],
              "d2": bpplantData["BPP_EX4ON"],
            }
          ];
          if (num != -1) {
            rows[num]["selected"] = true;
          }
          loading = false;
        });
      } else if (mounted) {
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
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
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
                      color: borderColor,
                      width: 2.0,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(238, 205, 205, 205),
                              border: Border(
                                right: BorderSide(
                                  color: borderColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 3),
                            child: Text('Parameters',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: borderColor,
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(238, 205, 205, 205),
                              border: Border(
                                right: BorderSide(
                                  color: borderColor,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            child: Text("BPP11",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: borderColor,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(238, 205, 205, 205),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            child: Text("BPP10",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: borderColor,
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
                          color: borderColor, // Border color
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 0),
                      child: _row(
                          r["head"],
                          r["data1"],
                          r["data2"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"],
                          state),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, color, i, state) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 6,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: Text(
            h,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
            color: i == 1
                ? state[0]["d1"] == 0
                    ? myColors["deactive"]
                    : myColors["active"]
                : i == 2
                    ? state[1]["d1"] == 0
                        ? myColors["deactive"]
                        : myColors["active"]
                    : const Color.fromARGB(0, 255, 193, 7),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: Text(d1,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          decoration: BoxDecoration(
            color: i == 1
                ? state[0]["d2"] == 0
                    ? myColors["deactive"]
                    : myColors["active"]
                : i == 2
                    ? state[1]["d2"] == 0
                        ? myColors["deactive"]
                        : myColors["active"]
                    : const Color.fromARGB(0, 255, 193, 7),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d2,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
