import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Compnent/overview/Basic_oxygen_furnace.dart';
import 'package:in.iisco.upv/Compnent/overview/Blast_furnace.dart';
import 'package:in.iisco.upv/Compnent/overview/By_product_plant.dart';
import 'package:in.iisco.upv/Compnent/overview/CBM.dart';
import 'package:in.iisco.upv/Compnent/overview/Coke_ovens.dart';
import 'package:in.iisco.upv/Compnent/overview/Continuous_casting_plant.dart';
import 'package:in.iisco.upv/Compnent/overview/Ladle_heating_furnace.dart';
import 'package:in.iisco.upv/Compnent/overview/Lime_dolo_calcination_plant.dart';
import 'package:in.iisco.upv/Compnent/overview/Mills.dart';
import 'package:in.iisco.upv/Compnent/overview/Power_blowing_station.dart';
import 'package:in.iisco.upv/Compnent/overview/Sinter_plant.dart';
import 'package:in.iisco.upv/Compnent/overview/Techno_economics.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

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

  // _changeColor(no) {
  //   setState(() {
  //     for (int i = 0; i < rows.length; i++) {
  //       rows[i]["selected"] = false;
  //     }
  //     rows[no]["selected"] = true;
  //     num = no;
  //   });
  // }

  List<dynamic> rows = [];

  @override
  Widget build(BuildContext context) {
    // blastfurnacedata();
    return Column(
      children: [
        _heaad("BLAST FURNACE"),
        const Col(),
        const SizedBox(
          height: 14,
        ),

        _heaad("SINTER PLANT"),
        const SinterPlant(),
        const SizedBox(
          height: 14,
        ),

        _heaad("BASIC OXYGEN FURNACE"),
        const BOF(),
        const SizedBox(
          height: 14,
        ),
        _heaad("CONTINUOUS CASTING PLANT"),
        const Ccp(),
        const SizedBox(
          height: 14,
        ),
        _heaad("LADLE HEATING FURNACE"),
        const Lhf(),
        const SizedBox(
          height: 14,
        ),
        _heaad("MILLS"),
        const Mills(),
        const SizedBox(
          height: 14,
        ),
        _heaad("POWER & BLOWING STATION"),
        const Pbs(),
        const SizedBox(
          height: 14,
        ),
        // _heaad("OXYGEN PLANT"),
        _heaad("CBM"),
        const Cbm(),
        const SizedBox(
          height: 14,
        ),
        _heaad("COKE OVENS"),
        const CokeOvens(),
        const SizedBox(
          height: 14,
        ),
        _heaad("BY PRODUCT PLANT"),
        const Bpplant(),
        const SizedBox(
          height: 14,
        ),

        _heaad("LIME & DOLO CALCINATION PLANT"),
        const Ldcp(),
        const SizedBox(
          height: 14,
        ),
        _heaad("TECHNO ECONOMICS"),
        const TechnoEco()
      ],
    );
  }
}

Widget _heaad(text) {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(123, 44, 129, 227), // Border color
                width: 2.0, // Border width
              ),
              color: borderColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
            child: Text(
              text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          )),
    ),
  );
}
