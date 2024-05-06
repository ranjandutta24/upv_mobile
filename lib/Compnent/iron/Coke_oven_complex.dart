// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class Coc extends StatefulWidget {
  const Coc({super.key});

  @override
  State<Coc> createState() {
    return CocState();
  }
}

class CocState extends State<Coc> {
  late dynamic cocData;
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
    cocService();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      cocService();
    });
  }

  List<dynamic> rows = [];

  cocService() async {
    if (mounted) {
      await cokeovencomplexservice().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            cocData = json.decode(data.body);
            rows = [
              {
                "head": "COG Flow Block 1/2 [Nm3/hr]",
                "data1": cocData["CO_GAS1_F"].toStringAsFixed(0),
                "data2": cocData["CO_GAS2_F"].toStringAsFixed(0),
                "selected": false,
                "i": 0,
              },
              {
                "head": "COG Press.Block 1/2 [MMWC]",
                "data1": cocData["CO_GAS1_P"].toStringAsFixed(0),
                "data2": cocData["CO_GAS2_P"].toStringAsFixed(0),
                "selected": false,
                "i": 1,
              },
              {
                "head": "LP Steam Press.1/2 [Kg/cm2]",
                "data1": cocData["CD_PR_LPS1_P"].toStringAsFixed(0),
                "data2": cocData["CD_PR_LPS2_P"].toStringAsFixed(0),
                "selected": false,
                "i": 2,
              },
              {
                "head": "LP Steam Flow.1/2 [tph]",
                "data1": cocData["CD_PR_LPS1_F"].toStringAsFixed(0),
                "data2": cocData["CD_PR_LPS2_F"].toStringAsFixed(0),
                "selected": false,
                "i": 3,
              },
              {
                "head": "HP Steam Press.1/2[Kg/cm2]",
                "data1": cocData["CD_HPS1_P"].toStringAsFixed(0),
                "data2": cocData["CD_HPS2_P"].toStringAsFixed(0),
                "selected": false,
                "i": 4,
              },
              {
                "head": "HP Steam Flow[tph]",
                "data1": cocData["CD_HPS1_F"].toStringAsFixed(0),
                "data2": cocData["CD_HPS2_F"].toStringAsFixed(0),
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
                            child: Text('Production',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: borderColor,
                                    fontSize: 13)),
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
                            child: Text("Value 1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: borderColor,
                                    fontSize: 13),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: const Color.fromARGB(238, 205, 205, 205),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 0),
                            child: Text("Value 2",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: borderColor,
                                    fontSize: 13),
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
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(
            h,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w600),
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
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d1,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d2,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
    ],
  );
}
