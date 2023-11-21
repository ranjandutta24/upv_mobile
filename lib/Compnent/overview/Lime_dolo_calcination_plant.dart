import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Utils/colors.dart';

class Ldcp extends StatefulWidget {
  const Ldcp({super.key});

  @override
  State<Ldcp> createState() {
    return LdcpState();
  }
}

class LdcpState extends State<Ldcp> {
  var loading = true;
  late dynamic ldcpData;
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
    TechnoService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      TechnoService();
    });
  }

  List<dynamic> rows = [];
  List<dynamic> state = [];

  TechnoService() async {
    await limedolocalcinationplant().then((data) {
      if (mounted) {
        setState(() {
          ldcpData = json.decode(data.body);
          rows = [
            {
              "head": "Kiln Temperature[DegC]",
              "data1": ldcpData["LDCP_K1TEMP"].toString(),
              "data2": ldcpData["LDCP_K2TEMP"].toString(),
              "data3": ldcpData["LDCP_K3TEMP"].toString(),
              "data4": ldcpData["LDCP_K4TEMP"].toString(),
              "selected": false,
              "i": 0,
            },
            {
              "head": "Mixed Gas Flow[Nm3/hr]",
              "data1": ldcpData["K1_MG"].toString(),
              "data2": ldcpData["K2_MG"].toString(),
              "data3": ldcpData["K3_MG"].toString(),
              "data4": ldcpData["K4_MG"].toString(),
              "selected": false,
              "i": 1,
            },
            {
              "head": "Exhaust Gas Temperature[DegC]",
              "data1": ldcpData["ETK1"].toString(),
              "data2": ldcpData["ETK2"].toString(),
              "data3": ldcpData["ETK3"].toString(),
              "data4": ldcpData["ETK4"].toString(),
              "selected": false,
              "i": 2,
            },
            {
              "head": "Current Production[ton]",
              "data1": ldcpData["K1_PRODN"].toStringAsFixed(1),
              "data2": ldcpData["K2_PRODN"].toStringAsFixed(1),
              "data3": ldcpData["K3_PRODN"].toStringAsFixed(1),
              "data4": ldcpData["K4_PRODN"].toStringAsFixed(1),
              "selected": false,
              "i": 3,
            },
            {
              "head": "Calorific Value[KCal/Nm3]",
              "data1": ldcpData["CV"].toString(),
              "data2": ldcpData["ETK1"].toString(),
              "data3": ldcpData["ETK1"].toString(),
              "data4": ldcpData["ETK1"].toString(),
              "selected": false,
              "i": 4,
            },
            {
              "head": "Inlet Pressure[mbar]",
              "data1": ldcpData["INLETPRES"].toString(),
              "data2": ldcpData["INLETPRES"].toString(),
              "data3": ldcpData["ETK1"].toString(),
              "data4": ldcpData["ETK1"].toString(),
              "selected": false,
              "i": 5,
            },
          ];
          state = [
            {
              "k1": ldcpData["LDCP_K1R"].toString(),
              "k2": ldcpData["LDCP_K2R"].toString(),
              "k3": ldcpData["LDCP_K3R"].toString(),
              "k4": ldcpData["LDCP_K4R"].toString(),
            }
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
            ? const Text(" ")
            : Column(children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(113, 43, 76, 98),
                      width: 2.0,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
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
                              vertical: 5, horizontal: 3),
                          child: const Text('Parameter',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 11,
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              border: const Border(
                                right: BorderSide(
                                  color: Color.fromARGB(113, 56, 104, 156),
                                  width: 2.0,
                                ),
                              ),
                              color: state[0]["k1"] == "False"
                                  ? myColors["deactive"]
                                  : myColors["active"]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("KILN 1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: myColors["header"],
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
                                  color: Color.fromARGB(113, 74, 104, 156),
                                  width: 2.0,
                                ),
                              ),
                              color: state[0]["k2"] == "False"
                                  ? myColors["deactive"]
                                  : myColors["active"]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("KILN 2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: myColors["header"],
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
                                  color: Color.fromARGB(113, 56, 104, 156),
                                  width: 2.0,
                                ),
                              ),
                              color: state[0]["k3"] == "False"
                                  ? myColors["deactive"]
                                  : myColors["active"]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("KILN 3",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: myColors["header"],
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: state[0]["k4"] == "False"
                                  ? myColors["deactive"]
                                  : myColors["active"]),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("KILN 4",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
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
                          color: const Color.fromARGB(113, 44, 129, 227),
                          width: 1.0,
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
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ]));
  }
}

Widget _row(h, d1, d2, d3, d4, color, i) {
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
            style: TextStyle(color: color),
          ),
        ),
      ),
      i == 4 || i == 5
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
                child: Text(d1,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 4 || i == 5
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color.fromARGB(113, 74, 104, 156),
                      width: 2.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d2,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 4 || i == 5
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Color.fromARGB(113, 74, 104, 156),
                      width: 2.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d3,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
      i == 4 || i == 5
          ? const Text("")
          : Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(d4,
                    style: TextStyle(color: color),
                    textAlign: TextAlign.center),
              ),
            ),
    ],
  );
}
