// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

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

  fun() {
    hmrsService();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      hmrsService();
    });
  }

  List<dynamic> rows = [];
  List<dynamic> newrows = [];

  hmrsService() async {
    if (mounted) {
      await torpedoathmrs().then((data) {
        if (data != null) {
          // print(data.body);

          setState(() {
            hmrsData = json.decode(data.body);

            if (hmrsData.isNotEmpty) {
              var time = DateTime.parse(hmrsData[0]["TIME"])
                  .add(const Duration(hours: 5, minutes: 30));

              rows = [
                {
                  "head":
                      "${time.day.toString()}/${time.month.toString()}/${time.year.toString()}, ${time.hour.toString()}:${time.minute.toString()}",
                  "data1": hmrsData[0]["TLCNO"].toString(),
                  "data2":
                      double.parse(hmrsData[0]["NETWT"]).toStringAsFixed(2),
                  "selected": false,
                  "i": 0,
                },
              ];
            } else {
              rows = [];
            }

            newrows = hmrsData;

            // if (num != -1) {
            //   rows[num]["selected"] = true;
            // }
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
    print(newrows);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: loading
          ? const Text("rtrt ")
          : newrows.isEmpty
              ? Text("No Data", style: TextStyle(color: Colors.black))
              : Column(
                  children: [
                    for (final Map r in newrows)
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
                              color: borderColor, // Border color
                              width: 1.0,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 0),
                          child: _row(
                            r["TIME"],
                            r["TLCNO"],
                            r["NETWT"],
                            // r["selected"] == true ? _containerColora : _textColor,
                            // r["i"],
                          ),
                        ),
                      ),
                  ],
                ),
    );
  }
}

Widget _row(t, d1, d2) {
  getTime(time) {
    return DateTime.parse(time).add(const Duration(hours: 5, minutes: 30));
  }

  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Text(
                  "Time",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Text(
                  // getTime(h).day.toString(),

                  "${getTime(t).day.toString()}/${getTime(t).month.toString()}/${getTime(t).year.toString()}, ${getTime(t).hour.toString()}:${getTime(t).minute.toString()}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  // style: TextStyle(color: color),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Text(
                  "Torpedo No.",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Text(
                  d1.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Text(
                  "Torpedo Net Weight [in tons]",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                child: Text(
                  double.parse(d2).toStringAsFixed(2),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
