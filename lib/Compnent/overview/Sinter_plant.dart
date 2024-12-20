// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';
import 'package:in.iisco.upv/Widgets/loader.dart';

class SinterPlant extends StatefulWidget {
  const SinterPlant({super.key});
  @override
  State<SinterPlant> createState() {
    return SinterPlantState();
  }
}

class SinterPlantState extends State<SinterPlant> {
  late dynamic sinterData;
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
    if (mounted) {
      sinterplantService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        sinterplantService();
      });
    }
  }

  List<dynamic> rows = [];

  sinterplantService() async {
    if (!mounted) return;
    try {
      final data = await sinterplant();
      if (data != null && mounted) {
        // print(data.body);
        setState(() {
          sinterData = json.decode(data.body);
          rows = [
            {
              "head": "Emerg. Bunker Level[Ton]",
              "data1": sinterData["SP1_ESSB"].toString(),
              "data2": "",
              "selected": false,
              "i": 0,
            },
            {
              "head": "SLS Level[%]",
              "data1": sinterData["SP1_SLS_LEVEL"].toStringAsFixed(2),
              "data2": "",
              "selected": false,
              "i": 1,
            },
            {
              "head": "Suction Pressure[mmwc]",
              "data1": sinterData["SP1_SUCTION"].toStringAsFixed(0),
              "data2": sinterData["SP2_SUCTION"].toStringAsFixed(0),
              "selected": false,
              "i": 2,
            },
            {
              "head": "Burner Avg Temp [Deg C]",
              "data1": sinterData["SP1_BUNERAVGTEMP"].toStringAsFixed(0),
              "data2": sinterData["SP2_BUNERAVGTEMP"].toStringAsFixed(0),
              "selected": false,
              "i": 3,
            },
            {
              "head": "Machine Speed [m/min]",
              "data1": sinterData["SP1_MCSPEED"].toStringAsFixed(2),
              "data2": sinterData["SP2_MCSPEED"].toStringAsFixed(2),
              "selected": false,
              "i": 4,
            },
            {
              "head": "Waste Gas Fan [RPM]",
              "data1": sinterData["SP1_WGRPM"].toStringAsFixed(0),
              "data2": sinterData["SP2_WGRPM"].toStringAsFixed(0),
              "selected": false,
              "i": 5,
            },
            {
              "head": "Mix Gas Flow [Nm3/hr]",
              "data1": sinterData["SP1_MIXGASF"].toStringAsFixed(0),
              "data2": sinterData["SP2_MIXGASF"].toStringAsFixed(0),
              "selected": false,
              "i": 6,
            },
            {
              "head": "A Shift Prod",
              "data1": sinterData["SP1_A"].toStringAsFixed(0),
              "data2": sinterData["SP2_A"].toStringAsFixed(0),
              "selected": false,
              "i": 7,
            },
            {
              "head": "B Shift Prod",
              "data1": sinterData["SP1_B"].toStringAsFixed(0),
              "data2": sinterData["SP2_B"].toStringAsFixed(0),
              "selected": false,
              "i": 8,
            },
            {
              "head": "C Shift Prod",
              "data1": sinterData["SP1_C"].toStringAsFixed(0),
              "data2": sinterData["SP2_C"].toStringAsFixed(0),
              "selected": false,
              "i": 9,
            },
            {
              "head": "Production [Ton]",
              "data1": sinterData["SP1_PROD"].toStringAsFixed(0),
              "data2": sinterData["SP2_PROD"].toStringAsFixed(0),
              "selected": false,
              "i": 10,
            },
            {
              "head": "Cooler Pressure [mbar]",
              "data1": sinterData["SP1_COOLERPRESS"].toStringAsFixed(2),
              "data2": sinterData["SP2_COOLERPRESS"].toStringAsFixed(2),
              "selected": false,
              "i": 11,
            },
          ];
          if (num != -1) {
            rows[num]["selected"] = true;
          }
          loading = false;
        });
      } else if (mounted) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).clearSnackBars();
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            content: const Center(
              child: Text('something wrong '),
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
          ? Container(
              padding: const EdgeInsets.all(10),
              child: const MyLoader(),
            )
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor, // Border color
                      width: 1.0, // Border width
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
                          child: Text(
                            "Parameter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows[4]["data1"]) < 0.1
                                ? myColors["deactive"]
                                : double.parse(rows[4]["data1"]) > 1
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("SP1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: double.parse(rows[4]["data2"]) < 0.1
                                ? myColors["deactive"]
                                : double.parse(rows[4]["data2"]) > 1
                                    ? myColors["active"]
                                    : const Color.fromARGB(0, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("SP2",
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
      i == 0 || i == 1
          ? Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
              ),
            )
          : Expanded(
              flex: 1,
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
                    style: TextStyle(color: color, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
              ),
            ),

      i == 0 || i == 1
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d2,
                    style: TextStyle(color: color, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
              ),
            ),

      // Text(h, style: TextStyle(color: color)),
      // Text(d1, style: TextStyle(color: color)),
      // Text(d2, style: TextStyle(color: color)),
      // Text(d3, style: TextStyle(color: color)),
    ],
  );
}
