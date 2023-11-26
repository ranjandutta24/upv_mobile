import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Hmrs extends StatefulWidget {
  const Hmrs({super.key});

  @override
  State<Hmrs> createState() {
    return HmrsState();
  }
}

class HmrsState extends State<Hmrs> {
  late dynamic hmrsData;
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
    hmrsService();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      hmrsService();
    });
  }

  List<dynamic> rows = [];

  hmrsService() async {
    if (mounted) {
      await torpedoathmrs().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            hmrsData = json.decode(data.body);
            rows = [
              {
                {
                  "head": "TIME",
                  "data1": hmrsData["TLCNO"].toStringAsFixed(0),
                  "data2": hmrsData["NETWT"].toStringAsFixed(1),
                  "selected": false,
                  "i": 1,
                },
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
      child: loading
          ? const Text(" ")
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(113, 43, 76, 98),
                      width: 2.0,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
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
                            child: const Text('Time',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 2,
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
                            child: const Text("Torpedo No.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 152, 152, 152),
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        Expanded(
                          flex: 4,
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
                            child: const Text("Torpedo net Weight[in tons]",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 152, 152, 152),
                                ),
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
                          color: const Color.fromARGB(
                              113, 44, 129, 227), // Border color
                          width: 1.0,
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
                      ),
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
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(
                color: Color.fromARGB(113, 44, 129, 227),
                width: 2.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Text(
              h,
              style: TextStyle(color: color),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Text(
              d1,
              style: TextStyle(color: color),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      Expanded(
        flex: 4,
        child: Container(
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Text(
              d1,
              style: TextStyle(color: color),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ],
  );
}
