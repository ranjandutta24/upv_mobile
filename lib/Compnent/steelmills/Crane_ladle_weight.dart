// ignore_for_file: file_names, camel_case_types

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class clwsm extends StatefulWidget {
  const clwsm({super.key});

  @override
  State<clwsm> createState() {
    return clwsmState();
  }
}

class clwsmState extends State<clwsm> {
  late dynamic cldData;
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
      craneladleweightService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        craneladleweightService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> state = [];

  craneladleweightService() async {
    if (mounted) {
      await craneladleweight().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            cldData = json.decode(data.body);
            rows = [
              {
                "head": "Weight Crane 1223 [Ton]",
                "data1": cldData["CRANE3"].toString(),
                "selected": false,
                "i": 0,
              },
              {
                "head": "Weight Crane 1224 [Ton]",
                "data1": cldData["CRANE4"].toString(),
                "selected": false,
                "i": 1,
              },
            ];
            state = [
              {"data1": cldData["LF1_I1"], "data2": cldData["LF2_I1"]}
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
                    color: borderColor,
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
                            child: Text('Parameters',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: borderColor,
                                )),
                          )),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("Value",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
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
                          color: borderColor, // Border color
                          width: 1.0,
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
        flex: 10,
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
        flex: 8,
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d1,
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
