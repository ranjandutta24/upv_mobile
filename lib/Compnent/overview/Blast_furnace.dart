// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';
import 'package:in.iisco.upv/Widgets/counting.dart';
import 'package:in.iisco.upv/Widgets/loader.dart';

class Col extends StatefulWidget {
  const Col({super.key});
  @override
  State<Col> createState() {
    return ColState();
  }
}

class ColState extends State<Col> {
  late dynamic blastData;
  var loading = true;
  var num = -1;

  @override
  void initState() {
    super.initState();

    fun();
  }

  final Color _containerColor = const Color.fromARGB(255, 17, 156, 43);
  final Color _containerColora = const Color.fromARGB(255, 255, 255, 255);
  final Color _textColor = const Color.fromARGB(255, 0, 0, 0);

  _changeColor(no) {
    if (mounted) {
      setState(() {
        for (int i = 0; i < rows.length; i++) {
          rows[i]["selected"] = false;
        }
        rows[no]["selected"] = true;
        num = no;
      });
    }
  }

  fun() {
    if (mounted) {
      blastfurnacedata();
      var duration = const Duration(seconds: 10);
      Timer.periodic(duration, (Timer timer) {
        blastfurnacedata();
      });
    }
  }

  List<dynamic> rows = [];

  blastfurnacedata() async {
    if (!mounted) return;
    try {
      final data = await blastfurnace();
      // print(data.body);

      // {"OXY_FL_NL":"-5.98467636108398","OXY_PR_NL":"7.09182119369507","LAST_UPDATE_FROM_OPC":"2025-02-19T18:49:09.000Z","BF_COLDF":6026.99853515625,"OF":21387.19921875,"CDI_INJRATE":56.99497985839844,"CDISP":55,"BF_COLDP":4.416546821594238,"BF_TOPP":2.492987871170044,"DELTAP":1.8191518783569336,"HBTAVG":1185.035888671875,"BF_TOPT":162.611328125,"RAFT":2292.710693359375,"BF_CO":45.67720413208008,"TOTAL_HEAT_LOAD":14129.4775390625,"BF_CHARGE":95,"BF_FLAREF":94702.2890625,"BF_FLAREP":887.128662109375,"O2PER":4.407636642456055,"BTSP":1180,"OREBYCOKE":25.399999618530273,"PROD_RATE":559.0993928909302,"TORPEDO1":83.04173278808594,"TORPEDO2":74.70862579345703,"TORPEDO3":22.88711166381836,"TORPEDO4":0.028934400528669357,"TORPEDO5":27.83489418029785,"TORPEDO6":29.918170928955078,"TORPEDO7":0,"TORPEDO8":null,"LAB_SI":0.4399999976158142,"LAB_HR":23,"LAB_MIN":19,"NRUNNERBF_RUNNERTEMP1":"1527.28","NRUNNERBF_RUNNERTEMP2":"1469.77","NRUNNERBF_RUNNERTEMP3":"1497.32","NRUNNERBF_RUNNERTEMP4":"1511.95","NRUNNERBF_RUNNERTIME1":"0.00","NRUNNERBF_RUNNERTIME2":"0.00","NRUNNERBF_RUNNERTIME3":"0.00","NRUNNERBF_RUNNERTIME4":"0.00","PBS_SNORT":0.8011720180511475,"HRPRODUPDATE_CDIRATE":"10","BURDENREPORT_CHRGVOL":"106.51","BURDENREPORT_HM":44.6149,"BURDENREPORT_CHARGE":4238.4155,"LADLE_BFTLMSPROD":6353.799999999999,"LADLE_BOFA":null,"LADLE_BOFB":null,"LADLE_BOFC":null}

      if (data != null && mounted) {
        setState(() {
          blastData = json.decode(data.body);
          // print(blastData);
          // print((blastData["DELTAP"].runtimeType));
          rows = [
            {
              "head": "Blast Volume [Nm3/min]",
              "data": [blastData["BF_COLDF"] ?? 0],
              "selected": false,
              "i": 0,
            },
            {
              "head": "O2 Enrich [Nm3/hr]",
              "data": [blastData["OF"] ?? 0],
              "selected": false,
              "i": 1
            },
            {
              "head": "CDI Rate [TPH] PV/SV",
              "data": [blastData["CDI_INJRATE"], blastData["CDISP"]],
              "selected": false,
              "i": 2
            },
            {
              "head": "Blast Pressure [Kg/cm2]",
              "data": [blastData["BF_COLDP"]],
              "selected": false,
              "i": 3
            },
            {
              "head": "Top Pressure [Kg/cm2]",
              "data": [blastData["BF_TOPP"]],
              "selected": false,
              "i": 4
            },
            {
              "head": "Delta P [Kg/cm2]",
              "data": [blastData["DELTAP"]],
              "selected": false,
              "i": 5
            },
            {
              "head": "Top Temperature [DegC]",
              "data": [blastData["BF_TOPT"]],
              "selected": false,
              "i": 6
            },
            {
              "head": "Blast Temp [DegC] PV/SV",
              "data": [blastData["HBTAVG"], blastData["BTSP"]],
              "selected": false,
              "i": 7
            },
            {
              "head": "Raft [DegC]",
              "data": [blastData["RAFT"]],
              "selected": false,
              "i": 8
            },
            {
              "head": "ETA CO [%]",
              "data": [blastData["BF_CO"]],
              "selected": false,
              "i": 9
            },
            {
              "head": "Heat Load[Mcal]",
              "data": [blastData["TOTAL_HEAT_LOAD"]],
              "selected": false,
              "i": 10
            },
            {
              "head": "Charge Count",
              "data": [blastData["BF_CHARGE"]],
              "selected": false,
              "i": 11
            },
            {
              "head": "Charge Volume[m3]",
              "data": [double.parse(blastData["BURDENREPORT_CHRGVOL"])],
              "selected": false,
              "i": 12
            },
            {
              "head": "Exp. HM/Charge[Ton]/Cumm.",
              "data": [
                blastData["BURDENREPORT_HM"],
                blastData["BURDENREPORT_CHARGE"]
              ],
              "selected": false,
              "i": 13
            },
            {
              "head": "Last Day HM Prod [Ton]",
              "data": [blastData["LADLE_BFTLMSPROD"]],
              "selected": false,
              "i": 14
            },
            {
              "head": "Curr. Day HM Prod[Ton] A/B/C",
              "data": [
                blastData["LADLE_BOFA"] ?? 0,
                blastData["LADLE_BOFB"] ?? 0,
                blastData["LADLE_BOFC"] ?? 0
              ],
              "selected": false,
              "i": 15
            },
            {
              "head": "Silicon[%]@ Sample time",
              "data": [
                blastData["LAB_SI"],
                blastData["LAB_HR"] ?? 0,
                blastData["LAB_MIN"] ?? 0
              ],
              "selected": false,
              "i": 16
            },
            {
              "head": "Runner#1 Hot Metal Temp [DegC]",
              "data": [double.parse(blastData["NRUNNERBF_RUNNERTEMP1"])],
              "selected": false,
              "i": 17
            },
            {
              "head": "Runner#2 Hot Metal Temp [DegC]",
              "data": [double.parse(blastData["NRUNNERBF_RUNNERTEMP2"])],
              "selected": false,
              "i": 18
            },
            {
              "head": "Runner#3 Hot Metal Temp [DegC]",
              "data": [double.parse(blastData["NRUNNERBF_RUNNERTEMP3"])],
              "selected": false,
              "i": 19
            },
            {
              "head": "Runner#4 Hot Metal Temp [DegC]",
              "data": [double.parse(blastData["NRUNNERBF_RUNNERTEMP4"])],
              "selected": false,
              "i": 20
            },
            {
              "head": "Flare Stack Flow [Nm3/hr]",
              "data": [blastData["BF_FLAREF"]],
              "selected": false,
              "i": 21
            },
            {
              "head": "Flare Stack Pressure [mmwc]",
              "data": [blastData["BF_FLAREP"]],
              "selected": false,
              "i": 22
            },
            {
              "head": "O2 Enriched [%]",
              "data": [blastData["O2PER"]],
              "selected": false,
              "i": 23
            },
            {
              "head": "O2 Flow (new line) [Nm3/hr]",
              "data": [(double.parse(blastData["OXY_FL_NL"]))],
              "selected": false,
              "i": 24
            },
            {
              "head": "O2 Pressure (new line) [Kg/cm2]",
              "data": [(double.parse(blastData["OXY_PR_NL"]))],
              "selected": false,
              "i": 25
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
              child: Text('somthing wrong'),
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
    // blastfurnacedata();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: loading
          ? Container(
              padding: const EdgeInsets.all(10),
              child: const MyLoader(),
            )
          : Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(238, 205, 205, 205),
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
                                color: borderColor),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(238, 205, 205, 205),
                            // border: Border(
                            //   left: BorderSide(
                            //     color: Color.fromARGB(113, 44, 129, 227),
                            //     width: 1.0,
                            //   ),
                            // ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 3),
                          child: Text(
                            "Value",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: borderColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      // Text(
                      //   "Parameter",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.bold,
                      //       color: Color.fromARGB(255, 152, 152, 152)),
                      // ),
                      // Text("Value",
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         color: Color.fromARGB(255, 152, 152, 152),),),
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
                          vertical: 0, horizontal: 0),
                      child: _row(
                          r["head"],
                          r["data"],
                          r["selected"] == true ? _containerColora : _textColor,
                          r["i"]),
                    ),
                  ),
              ],
            ),
    );
  }
}

Widget _row(h, d, color, i) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        flex: 7,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            child: Text(
              h,
              style: TextStyle(color: color, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      i == 5
          ? Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    color: d[0] >= 1.6 && d[0] <= 1.65
                        ? Colors.amber
                        : d[0] > 1.65
                            ? const Color.fromARGB(255, 255, 64, 64)
                            : const Color.fromARGB(0, 252, 252, 252)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                  child: Counting(
                    value: d[0],
                    color: color,
                  ),
                ),
              ),
            )
          : Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                  child: i == 2 || i == 7 || i == 13
                      ? Text(
                          "${d[0].toStringAsFixed(0)}/${d[1].toStringAsFixed(0)}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: color,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : i == 15
                          ? Text(
                              "${d[0].toStringAsFixed(0)}/${d[1].toStringAsFixed(0)}/${d[2].toStringAsFixed(0)}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          : i == 16
                              ? Text(
                                  "${d[0].toStringAsFixed(2)}@${d[1].toStringAsFixed(0)}:${d[2].toStringAsFixed(0)}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:
                                        color, // Replace with your color variable
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              : Counting(
                                  value: d[0],
                                  color: color,
                                ),
                ),
              ),
            ),
    ],
  );
}
