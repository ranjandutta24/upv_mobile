// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Services/service_page.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

class swwsm extends StatefulWidget {
  const swwsm({super.key});
  @override
  State<swwsm> createState() {
    return swwsmState();
  }
}

class swwsmState extends State<swwsm> {
  late dynamic carData;
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
    swwsService();
    var duration = const Duration(seconds: 30);
    Timer.periodic(duration, (Timer timer) {
      swwsService();
    });
  }

  List<dynamic> rows = [];
  List<dynamic> rows2 = [];

  swwsService() async {
    if (mounted) {
      await swws().then((data) {
        if (data != null) {
          setState(() {
            carData = json.decode(data.body);
            rows = [
              {
                "head": "RMHP",
                "data1": "-",
                "data2": "-",
                "data3": "-",
                "selected": false,
                "i": 0,
              },
              {
                "head": "Sinter Plant",
                "data1": "-",
                "data2": "-",
                "data3": "-",
                "selected": false,
                "i": 1,
              },
              {
                "head": "Coke Oven Battery",
                "data1": "-",
                "data2": "-",
                "data3": "-",
                "selected": false,
                "i": 2,
              },
              {
                "head": "Blast Furnace",
                "data1": carData["bf"]["Water_Flow_BF"].toString(),
                "data2": "-",
                "data3": "-",
                "selected": false,
                "i": 3,
              },
              {
                "head": "BOF",
                "data1": "-",
                "data2": "-",
                "data3": "-",
                "selected": false,
                "i": 4,
              },
              {
                "head": "CCP",
                "data1": "-",
                "data2": "-",
                "data3": "-",
                "selected": false,
                "i": 5,
              },
              {
                "head": "WRM /BAR Mill",
                "data1": carData["mills"]["WRBM_MK_WS"].toString(),
                "data2": "-",
                "data3": carData["mills"]["WRBM_MK_WS_TOT"].toString(),
                "selected": false,
                "i": 6,
              },
              {
                "head": "Mills Reheating Furnace (RHF)",
                "data1": carData["mills"]["MILLS_RHF_WATER_FLOW"].toString(),
                "data2": "-",
                "data3":
                    carData["mills"]["MILLS_RHF_WATER_FLOW_TOT"].toString(),
                "selected": false,
                "i": 7,
              },
              {
                "head": "USM",
                "data1": carData["mills"]["USM_MK_WS"].toString(),
                "data2": "-",
                "data3": carData["mills"]["USM_MK_WS_TOT"].toString(),
                "selected": false,
                "i": 8,
              },
              {
                "head": "Oxygen Plant",
                "data1": carData["oxygen"]["oxywater"].toString(),
                "data2": carData["oxygen"]["difference_oxy"].toString(),
                "data3": carData["oxygen"]["waterflow_total"].toString(),
                "selected": false,
                "i": 9,
              },
              {
                "head": "PBS",
                "data1": "-",
                "data2": "-",
                "data3": "-",
                "selected": false,
                "i": 10,
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
          ? const Text("")
          : Column(
              children: [
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

Widget _row(h, d1, d2, d3, color, i) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // flex: 4,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                h,
                style:
                    TextStyle(color: borderColor, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Real-time water flow [Nm3/hr]",
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d1,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Previous Day total Flow [Nm3/hr]",
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d2,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                "Total Water Inlet Flow [m3]",
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: Text(
                d3,
                style: TextStyle(
                    color: color, fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    ],
  );
}


// {"FT56_SCL":26678,"PT161_SCL":7,"FT56A_SCL":27090,"PT161A_SCL":7.21999979019165,"AI_6_COMP1":0,"AI_6_COMP2":20396,"AI_6_COMP3":0,"AI_6_COMP4":0,"AI_6_COMP5":19485,"AI_6_COMP6":9807,"igca_pr":5.277778148651123,"igca_flow":860.1585083007812,"pgca_pr":6.087963104248047,"pgca_flow":0,"pbs_inst_airpre":5.71441650390625,"MOTOR_CURR_COMP1":0,"MOTOR_CURR_COMP2":224,"MOTOR_CURR_COMP3":0,"MOTOR_CURR_COMP4":0,"MOTOR_CURR_COMP5":225,"MOTOR_CURR_COMP6":91.3,"INST_AIR_F":314.9364929199219,"INST_AIR_P":4.369094371795654,"PLANT_AIR_F":-8.680319786071777,"PLANT_AIR_P":6.174601078033447,"COMP_AIR_FLOW":null,"COMP_AIR_PRESSURE":null,"INST_P":5.299577236175537,"INST_F":2473.33203125}