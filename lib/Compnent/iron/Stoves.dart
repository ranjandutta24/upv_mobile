import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Stoves extends StatefulWidget {
  const Stoves({super.key});

  @override
  State<Stoves> createState() {
    return StovesState();
  }
}

class StovesState extends State<Stoves> {
  late dynamic stovesData;
  var loading = false;
  var num = -1;

  List<dynamic> rows = [];

  fun() {
    TechnoService();
    var duration = const Duration(seconds: 5);
    Timer.periodic(duration, (Timer timer) {
      TechnoService();
    });
  }

  TechnoService() async {
    await stoveService().then((data) {
      if (mounted) {
        print(data.body);
        setState(() {
          stovesData = json.decode(data.body);
          rows = [
            {
              "head": "Stv 1 Gas Flow [Nm3/hr]",
              "data1": stovesData["EX2"].toString(),
              "data2": stovesData["EX2"].toString(),
              "selected": false,
              "i": 0,
            },
            {
              "head": "Stv 1 Dome Temp. [DegC]",
              "data1": stovesData["EX2"].toString(),
              "data2": stovesData["EX2"].toString(),
              "selected": false,
              "i": 1,
            },
            {
              "head": "Stv 2 Gas Flow [Nm3/hr]",
              "data1": stovesData["EX2"].toString(),
              "data2": stovesData["EX2"].toString(),
              "selected": false,
              "i": 2,
            },
            {
              "head": "Stv 2 Dome Temp. [DegC]",
              "data1": stovesData["EX2"].toString(),
              "data2": stovesData["EX2"].toString(),
              "selected": false,
              "i": 3,
            },
            {
              "head": "Stv 3 Gas Flow [Nm3/hr]",
              "data1": stovesData["EX2"].toString(),
              "data2": stovesData["EX2"].toString(),
              "selected": false,
              "i": 4,
            },
            {
              "head": "Stv 3 Dome Temp.[DegC]",
              "data1": stovesData["EX2"].toString(),
              "data2": stovesData["EX2"].toString(),
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
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: loading
          ? const Text(" ")
          : Column(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(113, 44, 129, 227), // Border color
                    width: 2.0, // Border width
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
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
                          "Parameters",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 152, 152, 152)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: const BoxDecoration(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: const Text(
                          "Value",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 152, 152, 152),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
    );
  }
}
