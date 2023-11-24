// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class CasUt extends StatefulWidget {
  const CasUt({super.key});
  @override
  State<CasUt> createState() {
    return CasUtState();
  }
}

class CasUtState extends State<CasUt> {
  late dynamic carData;
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
      compressedairstationService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        compressedairstationService();
      });
    }
  }

  List<dynamic> rows = [];
  List<dynamic> rows2 = [];

  compressedairstationService() async {
    if (mounted) {
      await compressedairstation().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            carData = json.decode(data.body);
            rows = [
              {
                "head": "IGCA Flow (Nm3/hr)",
                "data1": carData["FT56_SCL"].toString(),
                "selected": false,
                "i": 0,
              },
              {
                "head": "IGCA Pressure (kg/cm2)",
                "data1": carData["PT161_SCL"].toStringAsFixed(2),
                "selected": false,
                "i": 1,
              },
              {
                "head": "PGCA Flow (Nm3/hr)",
                "data1": carData["FT56A_SCL"].toString(),
                "selected": false,
                "i": 2,
              },
              {
                "head": "PGCA Pressure (kg/cm2)",
                "data1": carData["PT161A_SCL"].toStringAsFixed(2),
                "selected": false,
                "i": 3,
              },
              {
                "head": "Compressor Flow (Nm3/hr)",
                "data1": carData["AI_6_COMP1"].toStringAsFixed(0),
                "data2": carData["AI_6_COMP2"].toStringAsFixed(0),
                "data3": carData["AI_6_COMP3"].toStringAsFixed(0),
                "data4": carData["AI_6_COMP4"].toStringAsFixed(0),
                "data5": carData["AI_6_COMP5"].toStringAsFixed(0),
                "selected": false,
                "i": 4,
              },
              {
                "head": "Current (amp)",
                "data1": carData["MOTOR_CURR_COMP1"].toStringAsFixed(0),
                "data2": carData["MOTOR_CURR_COMP2"].toStringAsFixed(0),
                "data3": carData["MOTOR_CURR_COMP3"].toStringAsFixed(0),
                "data4": carData["MOTOR_CURR_COMP4"].toStringAsFixed(0),
                "data5": carData["MOTOR_CURR_COMP5"].toStringAsFixed(0),
                "selected": false,
                "i": 5,
              },
            ];
            rows2 = [
              {
                "head": "Blast Furnace",
                "data1": carData["INST_AIR_F"].toStringAsFixed(2),
                "data2": carData["INST_AIR_P"].toStringAsFixed(2),
                "data3": carData["PLANT_AIR_F"].toStringAsFixed(2),
                "data4": carData["PLANT_AIR_P"].toStringAsFixed(2),
                "selected": false,
                "i": 1,
              },
              {
                "head": "LDCP",
                "data1": carData["INST_F"].toStringAsFixed(2),
                "data2": carData["INST_P"].toStringAsFixed(2),
                "data3": "NA",
                "data4": "NA",
                "selected": false,
                "i": 1,
              },
              {
                "head": "BOF",
                "data1": "0",
                "data2": "0",
                "data3": carData["COMP_AIR_FLOW"] == null
                    ? "NA"
                    : carData["COMP_AIR_FLOW"].toStringAsFixed(0),
                "data4": carData["COMP_AIR_PRESSURE"] == null
                    ? "NA"
                    : carData["COMP_AIR_PRESSURE"].toStringAsFixed(0),
                "selected": false,
                "i": 1,
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 3),
                      child: _row(
                          r["head"],
                          r["data1"],
                          r["data2"],
                          r["data3"],
                          r["data4"],
                          r["data5"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
                for (final Map r in rows2)
                  GestureDetector(
                    onTap: () {
                      // _changeColor(r["i"]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        // color: r["selected"] == true
                        //     ? _containerColor
                        //     : _containerColora,
                        border: Border.all(
                          color: const Color.fromARGB(
                              113, 44, 129, 227), // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 3),
                      child: _row2(
                          r["head"],
                          r["data1"],
                          r["data2"],
                          r["data3"],
                          r["data4"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, d3, d4, d5, color, i) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // flex: 4,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                h,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                (i == 0 || i == 1 || i == 2 || i == 3)
                    ? "Compressor"
                    : "Compressor1",
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d1,
                style: TextStyle(color: color),
              ),
            ),
          ),
          (i == 0 || i == 1 || i == 2 || i == 3)
              ? const Text("")
              : Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      "Compressor2",
                      style: TextStyle(color: color),
                    ),
                  ),
                ),
          (i == 0 || i == 1 || i == 2 || i == 3)
              ? const Text("")
              : Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      d2,
                      style: TextStyle(color: color),
                    ),
                  ),
                )
        ],
      ),
      (i == 0 || i == 1 || i == 2 || i == 3)
          ? const Row(
              children: [],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      "Compressor3",
                      style: TextStyle(color: color),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      d3,
                      style: TextStyle(color: color),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      "Compressor4",
                      style: TextStyle(color: color),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      d4,
                      style: TextStyle(color: color),
                    ),
                  ),
                )
              ],
            ),
      (i == 0 || i == 1 || i == 2 || i == 3)
          ? const Row(children: [])
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      "Compressor5",
                      style: TextStyle(color: color),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      d5,
                      style: TextStyle(color: color),
                    ),
                  ),
                ),
              ],
            ),
    ],
  );
}

Widget _row2(h, d1, d2, d3, d4, color, i) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // flex: 4,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                h,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Instrument Grade Flow (Nm3/hr)",
                style: TextStyle(color: color),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d1,
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Instrument Grade Pressure (kg/cm2)",
                style: TextStyle(color: color),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d2,
                style: TextStyle(color: color),
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Plant Grade Flow (Nm3/hr)",
                style: TextStyle(color: color),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d3,
                style: TextStyle(color: color),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Plant Grade Pressure (kg/cm2)",
                style: TextStyle(color: color),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d4,
                style: TextStyle(color: color),
              ),
            ),
          )
        ],
      ),
    ],
  );
}
