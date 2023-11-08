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
  late dynamic blastData;
  var loading = true;
  var num = -1;
  @override
  void initState() {
    super.initState();
    fun();
  }

  Color _containerColor = Color.fromARGB(255, 17, 156, 43);
  Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  Color _textColor = Color.fromARGB(255, 44, 44, 44);

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
    // var duration = const Duration(seconds: 5);
    // Timer.periodic(duration, (Timer timer) {
    //   BOFService();
    // });
  }

  List<dynamic> rows = [];

  BOFService() async {
    await Basicoxygenfurnace().then((data) {
      if (mounted) {
        print(data.body);
        setState(() {
          blastData = json.decode(data.body);
          rows = [
            {
              "head": "Heat A/B/C",
              "data":
                  "${blastData["BOF1_A"].toStringAsFixed(0)}/${blastData["BOF1_B"].toString()}/${blastData["BOF1_C"].toString()}",
              "selected": false,
              "i": 0,
            },
            {
              "head": "Blast Volume [Nm3/min]",
              "data": "BF_COLDF",
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: loading
          ? const Text("")
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 136, 137, 143), // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parameter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 152, 152, 152)),
                      ),
                      Text(
                        "BOF1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 152, 152, 152),
                        ),
                      ),
                      Text(
                        "BOF2",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 152, 152, 152),
                        ),
                      ),
                      Text(
                        "BOF3",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 152, 152, 152),
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
                              255, 165, 165, 165), // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 3),
                      child: _row(
                        r["head"],
                        r["data"],
                        r["selected"] == true ? _containerColora : _textColor,
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d, color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(h, style: TextStyle(color: color)),
      Text(d, style: TextStyle(color: color)),
      Text(d, style: TextStyle(color: color)),
      // Text(d, style: TextStyle(color: color)),
    ],
  );
}
