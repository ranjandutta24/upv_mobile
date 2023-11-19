import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class BOF extends StatefulWidget {
  const BOF({super.key});
  @override
  State<BOF> createState() {
    return BOFState();
  }
}

class BOFState extends State<BOF> {
  late dynamic bofData;
  var loading = true;
  var num = -1;
  @override
  void initState() {
    super.initState();
    fun();
  }

  Color _containerColor = const Color.fromARGB(255, 17, 156, 43);
  Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  Color _textColor = const Color.fromARGB(255, 44, 44, 44);

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
    BOFService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      BOFService();
    });
  }

  List<dynamic> rows = [];

  BOFService() async {
    await Basicoxygenfurnace().then((data) {
      if (mounted) {
        // print(data.body);
        setState(() {
          bofData = json.decode(data.body);
          rows = [
            {
              "head": "Heat A/B/C",
              "data1":
                  "${bofData["BOF1_A"].toStringAsFixed(0)}/${bofData["BOF1_B"].toString()}/${bofData["BOF1_C"].toString()}",
              "data2":
                  "${bofData["BOF2_A"].toStringAsFixed(0)}/${bofData["BOF2_B"].toString()}/${bofData["BOF2_C"].toString()}",
              "data3":
                  "${bofData["BOF3_A"].toStringAsFixed(0)}/${bofData["BOF3_B"].toString()}/${bofData["BOF3_C"].toString()}",
              "selected": false,
              "i": 0,
            },
            {
              "head": "Status",
              "data1": "${bofData["BOF1_STATUS"]}",
              "data2": "${bofData["BOF2_STATUS"]}",
              "data3": "${bofData["BOF3_STATUS"]}",
              "selected": false,
              "i": 1,
            },
            {
              "head": "Last Blow Duration(Mins)",
              "data1": bofData["BOF1_LASTHEATDURATION"] == null
                  ? "N/A"
                  : bofData["BOF1_LASTHEATDURATION"].toString(),
              "data2": bofData["BOF2_LASTHEATDURATION"] == null
                  ? "N/A"
                  : bofData["BOF2_LASTHEATDURATION"].toString(),
              "data3": bofData["BOF3_LASTHEATDURATION"] == null
                  ? "N/A"
                  : bofData["BOF3_LASTHEATDURATION"].toString(),
              "selected": false,
              "i": 2,
            },
            {
              "head": "Last Blow Start Time",
              "data1": bofData["BOF1_HEATSTART"],
              "data2": bofData["BOF2_HEATSTART"],
              "data3": bofData["BOF3_HEATSTART"],
              "selected": false,
              "i": 3,
            },
            {
              "head": "Charge To Tap Duration (Mins)",
              "data1": bofData["BOF1_LASTC2T"] == null
                  ? "N/A"
                  : bofData["BOF1_LASTC2T"].toString(),
              "data2": bofData["BOF2_LASTC2T"] == null
                  ? "N/A"
                  : bofData["BOF2_LASTC2T"].toString(),
              "data3": bofData["BOF3_LASTC2T"] == null
                  ? "N/A"
                  : bofData["BOF3_LASTC2T"].toString(),
              "selected": false,
              "i": 4,
            },
            {
              "head": "Tap To Tap Duration(Mins)",
              "data1": bofData["BOF1_LASTT2T"] == null
                  ? "N/A"
                  : bofData["BOF1_LASTT2T"].toString(),
              "data2": bofData["BOF2_LASTT2T"] == null
                  ? "N/A"
                  : bofData["BOF2_LASTT2T"].toString(),
              "data3": bofData["BOF3_LASTT2T"] == null
                  ? "N/A"
                  : bofData["BOF3_LASTT2T"].toString(),
              "selected": false,
              "i": 5,
            },
            {
              "head": "Last Tapping Finish Time",
              "data1": bofData["BOF1_LAST"] ?? "N/A",
              "data2": bofData["BOF2_LAST"] ?? "N/A",
              "data3": bofData["BOF3_LAST"] ?? "N/A",
              "selected": false,
              "i": 6,
            },
            {
              "head": "Temp [DegC]",
              "data1": bofData["TEMP_1"].toString(),
              "data2": bofData["TEMP_2"].toString(),
              "data3": bofData["TEMP_3"].toString(),
              "selected": false,
              "i": 7,
            },
            {
              "head": "O2 Consm [Nm3]",
              "data1": bofData["O2FLOWL11"].toStringAsFixed(0),
              "data2": bofData["O2FLOWL22"].toStringAsFixed(0),
              "data3": bofData["O2FLOWL33"].toStringAsFixed(0),
              "selected": false,
              "i": 8,
            },
            {
              "head": "Gas Recovery [Nm3]x 1000",
              "data1": bofData["BOF1_GASRECTOT"].toStringAsFixed(0),
              "data2": bofData["BOF2_GASRECTOT"].toStringAsFixed(0),
              "data3": bofData["BOF3_GASRECTOT"].toStringAsFixed(0),
              "selected": false,
              "i": 9,
            },
            {
              "head": "Lining Life",
              "data1": bofData["LINING_1"].toString(),
              "data2": bofData["LINING_2"].toString(),
              "data3": bofData["LINING_3"].toString(),
              "selected": false,
              "i": 10,
            },
            {
              "head": "Total Heat",
              "data1": (bofData["BOF1_A"] +
                      bofData["BOF1_B"] +
                      bofData["BOF1_C"] +
                      bofData["BOF2_A"] +
                      bofData["BOF2_B"] +
                      bofData["BOF2_C"] +
                      bofData["BOF3_A"] +
                      bofData["BOF3_B"] +
                      bofData["BOF3_C"])
                  .toString(),
              "data2": bofData["BOF2_PDAY"].toString(),
              "data3": bofData["BOF3_PDAY"].toString(),
              "selected": false,
              "i": 11,
            },
            {
              "head": "Prev. Day Heat",
              "data1":
                  "${(bofData["BOF1_PDAY"] + bofData["BOF2_PDAY"] + bofData["BOF3_PDAY"]).toString()} (${bofData["BOF1_PDAY"].toString()} + ${bofData["BOF2_PDAY"].toString()} + ${bofData["BOF3_PDAY"].toString()})",
              "data2": bofData["BOF2_PDAY"].toString(),
              "data3": bofData["BOF3_PDAY"].toString(),
              "selected": false,
              "i": 12,
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
              child: Text('Login Failed, wrong userid or password'),
            ),
            action: SnackBarAction(label: '', onPressed: () {}),
          ),
        );
      }
    });
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
                      color: const Color.fromARGB(
                          113, 44, 129, 227), // Border color
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
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 44, 129, 227),
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 3),
                          child: const Text(
                            "Parameter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: const Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 44, 129, 227),
                                width: 2.0,
                              ),
                            ),
                            color: rows[1]["data1"] == "Stop"
                                ? const Color.fromARGB(255, 255, 7, 7)
                                : const Color.fromARGB(255, 98, 255, 7),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("BOF1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border: const Border(
                                right: BorderSide(
                                  color: Color.fromARGB(113, 44, 129, 227),
                                  width: 2.0,
                                ),
                              ),
                              color: rows[1]["data2"] == "Stop"
                                  ? const Color.fromARGB(255, 255, 7, 7)
                                  : const Color.fromARGB(255, 98, 255, 7)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("BOF2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: rows[1]["data3"] == "Stop"
                                  ? const Color.fromARGB(255, 255, 7, 7)
                                  : const Color.fromARGB(255, 98, 255, 7)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("BOF3",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 94, 93, 93),
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
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, d3, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 4,
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
            style: TextStyle(color: color, fontSize: 12),
          ),
        ),
      ),
      i == 11 || i == 12
          ? (Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ))
          : Expanded(
              flex: 1,
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                  child: Text(d1,
                      style: TextStyle(color: color, fontSize: 12),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
      i == 11 || i == 12
          ? const Text("")
          : Expanded(
              flex: 1,
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
                child: Text(d2,
                    style: TextStyle(color: color, fontSize: 12),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 11 || i == 12
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d3,
                    style: TextStyle(color: color, fontSize: 12),
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
