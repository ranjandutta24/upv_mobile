// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

class TechnoEco extends StatefulWidget {
  const TechnoEco({super.key});
  @override
  State<TechnoEco> createState() {
    return TechnoEcoState();
  }
}

class TechnoEcoState extends State<TechnoEco> {
  late dynamic technoData;
  var loading = true;
  var num = -1;
  @override
  void initState() {
    super.initState();
    fun();
  }

  final Color _containerColor = const Color.fromARGB(255, 17, 156, 43);
  final Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  final Color _textColor = Color.fromARGB(255, 0, 0, 0);

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
      technoeconomicsService();
      var duration = const Duration(seconds: 30);
      Timer.periodic(duration, (Timer timer) {
        technoeconomicsService();
      });
    }
  }

  List<dynamic> rows = [];

  technoeconomicsService() async {
    if (!mounted) return;

    try {
      final data = await technoeconomics();

      if (data != null && mounted) {
        // print(data.body);
        setState(() {
          technoData = json.decode(data.body);
          rows = [
            {
              "head": "BFCokeRate[Kg/THM]",
              "data1": technoData["BFCOKE_NORM"].toString(),
              "data2": technoData["BFCOKE_ACTUAL"].toString(),
              "data3": technoData["BFCOKE_CPLM"].toString(),
              "data4": technoData["BFCOKE_CPLY"].toString(),
              "selected": false,
              "i": 0,
            },
            {
              "head": "CDI Rate[Kg/THM]",
              "data1": technoData["CDIRATE_NORM"].toString(),
              "data2": technoData["CDIRATE_ACTUAL"].toString(),
              "data3": technoData["CDIRATE_CPLM"].toString(),
              "data4": technoData["CDIRATE_CPLY"].toString(),
              "selected": false,
              "i": 1,
            },
            {
              "head": "Fuel Rate[Kg/THM]",
              "data1": technoData["FUELRATE_NORM"].toString(),
              "data2": technoData["FUELRATE_ACTUAL"].toString(),
              "data3": technoData["FUELRATE_CPLM"].toString(),
              "data4": technoData["FUELRATE_CPLY"].toString(),
              "selected": false,
              "i": 2,
            },
            {
              "head": "BF Prod [T/m3/Day]",
              "data1": technoData["BFPRO_NORM"].toStringAsFixed(2),
              "data2": technoData["BFPRO_ACTUAL"].toStringAsFixed(2),
              "data3": technoData["BFPRO_CPLM"].toStringAsFixed(2),
              "data4": technoData["BFPRO_CPLY"].toStringAsFixed(2),
              "selected": false,
              "i": 3,
            },
            {
              "head": "HM Consm[Kg/TCS]",
              "data1": technoData["HMCON_NORM"].toString(),
              "data2": technoData["HMCON_ACTUAL"].toString(),
              "data3": technoData["HMCON_CPLM"].toString(),
              "data4": technoData["HMCON_CPLY"].toString(),
              "selected": false,
              "i": 4,
            },
            {
              "head": "Scrap Consm[Kg/TCS]",
              "data1": technoData["SCRAP_NORM"].toString(),
              "data2": technoData["SCRAP_ACTUAL"].toString(),
              "data3": technoData["SCRAP_CPLM"].toString(),
              "data4": technoData["SCRAP_CPLY"].toString(),
              "selected": false,
              "i": 5,
            },
            {
              "head": "TMI[Kg/TCS]",
              "data1": technoData["TMI_NORM"].toString(),
              "data2": technoData["TMI_ACTUAL"].toString(),
              "data3": technoData["TMI_CPLM"].toString(),
              "data4": technoData["TMI_CPLY"].toString(),
              "selected": false,
              "i": 6,
            },
            {
              "head": "Power[Kwh/TCS]",
              "data1": technoData["POWER_NORM"].toString(),
              "data2": technoData["POWER_ACTUAL"].toString(),
              "data3": technoData["POWER_CPLM"].toString(),
              "data4": technoData["POWER_CPLY"].toString(),
              "selected": false,
              "i": 7,
            },
            {
              "head": "SPEnergy[GCal/TSS]",
              "data1": technoData["SPENERGY_NORM"].toStringAsFixed(2),
              "data2": technoData["SPENERGY_ACTUAL"].toStringAsFixed(2),
              "data3": technoData["SPENERGY_CPLM"].toStringAsFixed(2),
              "data4": technoData["SPENERGY_CPLY"].toStringAsFixed(2),
              "selected": false,
              "i": 8,
            },
            {
              "head": "SpWaterConsump[m3/TCS]",
              "data1": technoData["SPWATER_NORM"].toStringAsFixed(2),
              "data2": technoData["SPWATER_ACTUAL"].toStringAsFixed(2),
              "data3": technoData["SPWATER_CPLM"].toStringAsFixed(2),
              "data4": technoData["SWATER_CPLY"].toStringAsFixed(2),
              "selected": false,
              "i": 9,
            },
          ];
          if (num != -1) {
            rows[num]["selected"] = true;
          }
          loading = false;
        });
      } else if (mounted) {
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
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 3),
                          child: Text(
                            "Parameter",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                                color: borderColor),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("NORM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("ACTUAL",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                            border: Border(
                              right: BorderSide(
                                color: borderColor,
                                width: 2.0,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("CPLM",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                                color: borderColor,
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0),
                          child: Text("CPLY",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                                color: borderColor,
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
                          color: borderColor, // Border color
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
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d1, d2, d3, d4, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 7,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(
            h,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d1,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d2,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d3,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 40,
          decoration: const BoxDecoration(),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Text(d4,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w600),
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
