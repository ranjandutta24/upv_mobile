import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:upv_mobile/Compnent/overview/Basic_oxygen_furnace.dart';
import 'package:upv_mobile/Compnent/overview/Blast_furnace.dart';
import 'package:upv_mobile/Compnent/overview/CBM.dart';
import 'package:upv_mobile/Compnent/overview/Coke_ovens.dart';
import 'package:upv_mobile/Compnent/overview/Continuous_casting_plant.dart';
import 'package:upv_mobile/Compnent/overview/Ladle_heating_furnace.dart';
import 'package:upv_mobile/Compnent/overview/Mills.dart';
import 'package:upv_mobile/Compnent/overview/Power_blowing_station.dart';
import 'package:upv_mobile/Compnent/overview/Sinter_plant.dart';
import 'package:upv_mobile/Compnent/overview/Techno_economics.dart';
import 'package:upv_mobile/Services/service_page.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});
  @override
  State<Overview> createState() {
    return OverviewState();
  }
}

class OverviewState extends State<Overview> {
  late dynamic blastData;
  var loading = true;
  var num = -1;

  @override
  void initState() {
    super.initState();
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

  List<dynamic> rows = [];

  @override
  Widget build(BuildContext context) {
    // blastfurnacedata();
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(
                          113, 44, 129, 227), // Border color
                      width: 2.0, // Border width
                    ),
                    color: const Color.fromARGB(113, 44, 129, 227)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("BLAST FURNACE"),
                )),
          ),
        ),
        Col(),
        // Text("SINTER PLANT"),
        const SizedBox(
          height: 14,
        ),
        _heaad("SINTER PLANT"),
        SinterPlant(),

        _heaad("BASIC OXYGEN FURNACE"),
        BOF(),
        _heaad("CONTINUOUS CASTING PLANT"),
        Ccp(),
        _heaad("LADLE HEATING FURNACE"),
        Lhf(),
        _heaad("MILLS"),
        Mills(),
        _heaad("POWER & BLOWING STATION"),
        Pbs(),
        // _heaad("OXYGEN PLANT"),
        _heaad("CBM"),
        Cbm(),
        _heaad("COKE OVENS"),
        CokeOvens(),
        // Text("BY PRODUCT PLANT"),

        // Text("LIME & DOLO CALCINATION PLANT"),

        Text("TECHNO ECONOMICS"),
        TechnoEco()
      ],
    );
  }
}

Widget _heaad(text) {
  return SizedBox(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(113, 44, 129, 227), // Border color
                width: 2.0, // Border width
              ),
              color: const Color.fromARGB(113, 44, 129, 227)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          )),
    ),
  );
}
