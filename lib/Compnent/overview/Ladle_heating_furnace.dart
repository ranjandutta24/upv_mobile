import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Lhf extends StatefulWidget {
  const Lhf({super.key});

  State<Lhf> createState() {
    return LhfState();
  }
}

class LhfState extends State<Lhf> {
  late dynamic lhfData;
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
    TechnoService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      TechnoService();
    });
  }

  List<dynamic> rows = [];

  TechnoService() async {
    await powerblowingstation().then((data) {
      if (mounted) {
        print(data.body);
        setState(() {
          lhfData = json.decode(data.body);
          rows = [
            {
              "head": "Temp [DegC]",
              "data1": lhfData["LF1_TEMP1"].toString(),
              "data2": lhfData["LF1_TEMP1"].toString(),
              "data3": lhfData["LF1_TEMP1"].toString(),
              "selected": false,
              "i": 0,
            },
            {
              "head": "CaSi/Fe Wire Spd SP/Act",
              "data1": lhfData["LF1_TEMP1"].toString(),
              "data2": lhfData["LF1_TEMP1"].toString(),
              "data3": lhfData["LF1_TEMP1"].toString(),
              "selected": false,
              "i": 1,
            },
            {
              "head": "CaSi/Fe Wire Lth SP/Act",
              "data1": lhfData["LF1_TEMP1"].toString(),
              "data2": lhfData["LF1_TEMP1"].toString(),
              "data3": lhfData["LF1_TEMP1"].toString(),
              "selected": false,
              "i": 2,
            },
            {
              "head": "CaSi/Fe Wire Wt SP/Act ",
              "data1": lhfData["LF1_TEMP1"].toString(),
              "data2": lhfData["LF1_TEMP1"].toString(),
              "data3": lhfData["LF1_TEMP1"].toString(),
              "selected": false,
              "i": 3,
            },
            {
              "head": "Al Wire Spd SP/Act ",
              "data1": lhfData["LF1_TEMP1"].toString(),
              "data2": lhfData["LF1_TEMP1"].toString(),
              "data3": lhfData["LF1_TEMP1"].toString(),
              "selected": false,
              "i": 4,
            },
            {
              "head": "Al Wire SP/Act ",
              "data1": lhfData["LF1_TEMP1"].toString(),
              "data2": lhfData["LF1_TEMP1"].toString(),
              "data3": lhfData["LF1_TEMP1"].toString(),
              "selected": false,
              "i": 5,
            },
            {
              "head": "Al Wire Wt SP/Act ",
              "data1": lhfData["LF1_TEMP1"].toString(),
              "data2": lhfData["LF1_TEMP1"].toString(),
              "data3": lhfData["LF1_TEMP1"].toString(),
              "selected": false,
              "i": 6,
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
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: const Color.fromARGB(113, 43, 76, 98),
                    width: 2.0,
                  )),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
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
                                vertical: 5, horizontal: 0),
                            child: const Text('Parameters',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                )),
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Color.fromARGB(113, 56, 104, 156),
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("LF1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: const Text("LF2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 152, 152, 152),
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
      Expanded(
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
              style: TextStyle(color: color), textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 1,
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
