import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Bfsh extends StatefulWidget {
  const Bfsh({super.key});

  @override
  State<Bfsh> createState() {
    return BfshState();
  }
}

class BfshState extends State<Bfsh> {
  late dynamic bfshData;
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
    bfstockhouseService();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      bfstockhouseService();
    });
  }

  List<dynamic> rows = [];

  bfstockhouseService() async {
    if (mounted) {
      await bfstockhouse().then((data) {
        if (data != null) {
          // print(data.body);
          setState(() {
            bfshData = json.decode(data.body);
            rows = [
              {
                "head": "Add Bin #1 [%]",
                "data": "${bfshData["BF_ADD1"].toStringAsFixed(2)}",
                "selected": false,
                "i": 0,
              },
              {
                "head": "Add Bin #2 [%]",
                "data": "${bfshData["BF_ADD2"].toStringAsFixed(2)}",
                "selected": false,
                "i": 1,
              },
              {
                "head": "Add Bin #3 [%]",
                "data": "${bfshData["BF_ADD3"].toStringAsFixed(2)}",
                "selected": false,
                "i": 2,
              },
              {
                "head": "Add Bin #4 [%]",
                "data": "${bfshData["BF_ADD4"].toStringAsFixed(2)}",
                "selected": false,
                "i": 3,
              },
              {
                "head": "Coke Bin #1 [%]",
                "data": "${bfshData["BF_C1"].toStringAsFixed(2)}",
                "selected": false,
                "i": 4,
              },
              {
                "head": "Coke Bin #2 [%]",
                "data": "${bfshData["BF_C2"].toStringAsFixed(2)}",
                "selected": false,
                "i": 5,
              },
              {
                "head": "Coke Bin #3 [%]",
                "data": "${bfshData["BF_C3"].toStringAsFixed(2)}",
                "selected": false,
                "i": 6,
              },
              {
                "head": "Coke Bin #4 [%]",
                "data": "${bfshData["BF_C4"].toStringAsFixed(2)}",
                "selected": false,
                "i": 7,
              },
              {
                "head": "Coke Bin #5 [%]",
                "data": "${bfshData["BF_C5"].toStringAsFixed(2)}",
                "selected": false,
                "i": 8,
              },
              {
                "head": "Coke Bin #6 [%]",
                "data": "${bfshData["BF_C6"].toStringAsFixed(2)}",
                "selected": false,
                "i": 9,
              },
              {
                "head": "Sinter Bin #1 [%]",
                "data": "${bfshData["BF_SINT1"].toStringAsFixed(2)}",
                "selected": false,
                "i": 10,
              },
              {
                "head": "Sinter Bin #2 [%]",
                "data": "${bfshData["BF_SINT2"].toStringAsFixed(2)}",
                "selected": false,
                "i": 11,
              },
              {
                "head": "Sinter Bin #3 [%]",
                "data": "${bfshData["BF_SINT3"].toStringAsFixed(2)}",
                "selected": false,
                "i": 12,
              },
              {
                "head": "Sinter Bin #4 [%]",
                "data": "${bfshData["BF_SINT4"].toStringAsFixed(2)}",
                "selected": false,
                "i": 13,
              },
              {
                "head": "Sinter Bin #5 [%]",
                "data": "${bfshData["BF_SINT5"].toStringAsFixed(2)}",
                "selected": false,
                "i": 14,
              },
              {
                "head": "Sinter Bin #6 [%]",
                "data": "${bfshData["BF_SINT6"].toStringAsFixed(2)}",
                "selected": false,
                "i": 15,
              },
              {
                "head": "SMALL Sinter Bin #1 [%]",
                "data": "${bfshData["BF_SS1"].toStringAsFixed(2)}",
                "selected": false,
                "i": 16,
              },
              {
                "head": "SMALL Sinter Bin #2 [%]",
                "data": "${bfshData["BF_SS2"].toStringAsFixed(2)}",
                "selected": false,
                "i": 17,
              },
              {
                "head": "Ore Bin #1[%]",
                "data": "${bfshData["BF_ORE1"].toStringAsFixed(2)}",
                "selected": false,
                "i": 18,
              },
              {
                "head": "Ore Bin #2 [%]",
                "data": "${bfshData["BF_ORE2"].toStringAsFixed(2)}",
                "selected": false,
                "i": 19,
              },
              {
                "head": "Nut Coke Bin [%]",
                "data": "${bfshData["BF_NC"].toStringAsFixed(2)}",
                "selected": false,
                "i": 20,
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
      child: loading || !mounted
          ? const Text(" ")
          : Column(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        const Color.fromARGB(113, 44, 129, 227), // Border color
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
                          "Parameter",
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
                          textAlign: TextAlign.center,
                        ),
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
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 3),
                    child: _row(
                        r["head"],
                        r["data"],
                        r["selected"] == true ? _containerColora : _textColor,
                        r["i"]),
                  ),
                ),
            ]),
    );
  }
}

Widget _row(h, d, color, i) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
      flex: 3,
      child: Container(
        decoration: const BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          child: Text(
            d,
            style: TextStyle(color: color),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  ]);
}
