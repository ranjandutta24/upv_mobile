// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

class BofGasHoldUt extends StatefulWidget {
  const BofGasHoldUt({super.key});
  @override
  State<BofGasHoldUt> createState() {
    return BofGasHoldUtState();
  }
}

class BofGasHoldUtState extends State<BofGasHoldUt> {
  late dynamic gasholdData;
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
      bofgasholderService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        bofgasholderService();
      });
    }
  }

  List<dynamic> rows = [];

  bofgasholderService() async {
    if (mounted) {
      await bofgasholder().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            gasholdData = json.decode(data.body);
            rows = [
              {
                "head": "Gas Holder Level [metre]",
                "data1": gasholdData["GASHOLDERLVL"].toStringAsFixed(2),
                "selected": false,
                "i": 0,
              },
              {
                "head": "Gas Holder Pressure [mmWC]",
                "data1": gasholdData["GASHOLDERPRES"].toStringAsFixed(2),
                "data2": "",
                "selected": false,
                "i": 1,
              },
              {
                "head": "Gas Holder Temperature [DegC]",
                "data1": gasholdData["GASHOLDERTEMP"].toStringAsFixed(2),
                "data2": "",
                "selected": false,
                "i": 2,
              },
              {
                "head": "Exported Gas [Nm3/hr]",
                "data1": gasholdData["EXPORTEDGAS"].toStringAsFixed(2),
                "data2": "",
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
      child: loading
          ? const Text("")
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
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
                            "Parameter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor),
                          ),
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
                          width: 1.0, // Border width
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
        flex: 4,
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
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Expanded(
        flex: 2,
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
