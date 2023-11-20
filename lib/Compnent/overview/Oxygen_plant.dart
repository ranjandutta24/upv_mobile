import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class OxygenPlant extends StatefulWidget {
  const OxygenPlant({super.key});
  @override
  State<OxygenPlant> createState() {
    return OxygenPlantState();
  }
}

class OxygenPlantState extends State<OxygenPlant> {
  late dynamic oxygenData;
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
    oxygenplantService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      oxygenplantService();
    });
  }

  List<dynamic> rows = [];
  List<dynamic> state = [];

  oxygenplantService() async {
    await oxygenplant().then((data) {
      if (mounted) {
        // print(data.body);
        setState(() {
          oxygenData = json.decode(data.body);
          rows = [
            {
              "head": "HPGOX (Nm3/hr)",
              "data1": oxygenData["HPGOXP1"].toString(),
              "data2": oxygenData["HPGOXP2"].toString(),
              "selected": false,
              "i": 0,
            },
            {
              "head": "PGOX (Nm3/hr)",
              "data1": oxygenData["PGOXP1"].toString(),
              "data2": oxygenData["PGOXP2"].toString(),
              "selected": false,
              "i": 1,
            },
            {
              "head": "HPGAN (Nm3/hr)",
              "data1": oxygenData["HPGANP1"].toString(),
              "data2": oxygenData["HPGANP2"].toString(),
              "selected": false,
              "i": 2,
            },
            {
              "head": "PGAN (Nm3/hr)",
              "data1": oxygenData["PGANP1"].toString(),
              "data2": oxygenData["PGANP2"].toString(),
              "selected": false,
              "i": 3,
            },
            {
              "head": "Ar Flow BOF (Nm3/hr)",
              "data1": oxygenData["ARFLBOF"].toString(),
              "data2": oxygenData["ARFLBOF"].toString(),
              "selected": false,
              "i": 4,
            },
            {
              "head": "O2 Flow BF (Nm3/hr)",
              "data1": oxygenData["OXBF"].toString(),
              "data2": oxygenData["ARFLBOF"].toString(),
              "selected": false,
              "i": 5,
            },
            {
              "head": "O2 Flow CCP (Nm3/hr)",
              "data1": oxygenData["OFCCP"].toString(),
              "data2": oxygenData["ARFLBOF"].toString(),
              "selected": false,
              "i": 6,
            },
            {
              "head": "O2 Flow BOFS1 (Nm3/hr)",
              "data1": oxygenData["OFBOFS1"].toString(),
              "data2": oxygenData["ARFLBOF"].toString(),
              "selected": false,
              "i": 7,
            },
            {
              "head": "O2 Flow BOFS2 (Nm3/hr)",
              "data1": oxygenData["OFBOFS2"].toString(),
              "data2": oxygenData["ARFLBOF"].toString(),
              "selected": false,
              "i": 8,
            },
            {
              "head": "MAC Status",
              "data1": "MAC 1",
              "data2": "MAC 2",
              "selected": false,
              "i": 9,
            },
            {
              "head": "BAC Status",
              "data1": "BAC 1",
              "data2": "BAC 2",
              "selected": false,
              "i": 10,
            },
          ];
          state = [
            {"d1": oxygenData["MAC1_STAT"], "d2": oxygenData["BAC1_STAT"]},
            {"d1": oxygenData["MAC2_STAT"], "d2": oxygenData["BAC2_STAT"]}
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
                        flex: 6,
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
                              vertical: 5, horizontal: 0),
                          child: const Text(
                            "Parameter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: const Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 44, 129, 227),
                                width: 2.0,
                              ),
                            ),
                            color: double.parse(rows[0]["data1"]) >= 5000 &&
                                    state[0]["d1"] == 1 &&
                                    state[0]["d2"] == 1
                                ? myColors["active"]
                                : myColors["deactive"],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("PLANT 1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: myColors["header"],
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: double.parse(rows[0]["data2"]) >= 5000 &&
                                    state[1]["d1"] == 1 &&
                                    state[1]["d2"] == 1
                                ? myColors["active"]
                                : myColors["deactive"],
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("PLANT 2",
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
                          width: 1.0, // Border width
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
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Color.fromARGB(113, 44, 129, 227),
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          child: Text(
            h,
            style: TextStyle(color: color),
          ),
        ),
      ),
      i == 4 || i == 5 || i == 6 || i == 7 || i == 8
          ? Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            )
          : Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: const Border(
                    right: BorderSide(
                      color: Color.fromARGB(113, 44, 129, 227),
                      width: 2.0,
                    ),
                  ),
                  color: state[0]["d1"] == 1 && i == 9
                      ? myColors["active"]
                      : state[1]["d1"] == 1 && i == 10
                          ? myColors["active"]
                          : const Color.fromARGB(0, 144, 141, 134),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d1,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 4 || i == 5 || i == 6 || i == 7 || i == 8
          ? const Text("")
          : Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: state[0]["d2"] == 1 && i == 9
                      ? myColors["active"]
                      : state[1]["d2"] == 1 && i == 10
                          ? myColors["active"]
                          : const Color.fromARGB(0, 144, 141, 134),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d2,
                    style: TextStyle(color: color),
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
