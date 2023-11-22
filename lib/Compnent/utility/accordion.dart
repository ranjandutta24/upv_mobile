import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:upv_mobile/Compnent/utility/BOF_gas_holder.dart';

import 'package:upv_mobile/Compnent/utility/CBM.dart';
import 'package:upv_mobile/Compnent/utility/Lime_dolo_calcination_plant.dart';
import 'package:upv_mobile/Compnent/utility/Oxygen_plant.dart';
import 'package:upv_mobile/Compnent/utility/Power_blowing_station_utility.dart';

class AccordionUtility extends StatefulWidget {
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

  const AccordionUtility({
    Key? key,
    // required this.blastData,
  }) : super(key: key);

  // final blastData;

  @override
  State<AccordionUtility> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionUtility> {
  // late  blastData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Accordion(
        maxOpenSections: 10,
        paddingListBottom: 0,
        headerBorderColor: Colors.blueGrey,
        headerBorderColorOpened: Colors.transparent,
        // headerBorderWidth: 1,
        headerBackgroundColorOpened: const Color.fromARGB(255, 55, 114, 209),
        // headerBackgroundColorOpened: Colors.green,
        contentBackgroundColor: Colors.white,
        // contentBorderColor: Colors.green,
        contentBorderWidth: 2,
        contentHorizontalPadding: 0,
        contentVerticalPadding: 0,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 189, 171, 92),
            contentBorderColor: const Color.fromARGB(255, 189, 171, 92),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/power-plant.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text('POWER & BLOWING STATION',
                style: AccordionUtility.headerStyle),
            content: const PbsUt(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 189, 142, 92),
            contentBorderColor: const Color.fromARGB(255, 189, 142, 92),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/online.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text('BOF Gas Holder',
                style: AccordionUtility.headerStyle),
            content: const BofGasHoldUt(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 189, 171, 92),
            contentBorderColor: const Color.fromARGB(255, 189, 171, 92),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/power-plant.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header:
                const Text('Gas Utlity', style: AccordionUtility.headerStyle),
            content: const PbsUt(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 189, 171, 92),
            contentBorderColor: const Color.fromARGB(255, 189, 171, 92),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/power-plant.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text('Compressed Air Station',
                style: AccordionUtility.headerStyle),
            content: const PbsUt(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 204, 212, 52),
            contentBorderColor: const Color.fromARGB(255, 131, 152, 89),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/oxygen-tank.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header:
                const Text("OXYGEN PLANT", style: AccordionUtility.headerStyle),
            content: const OxygenPlantUt(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 161, 61, 174),
            contentBorderColor: const Color.fromARGB(255, 131, 152, 89),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/capacity.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text("LIME & DOLO CALCINATION PLANT",
                style: AccordionUtility.headerStyle),
            content: const LdcpUt(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 212, 196, 52),
            contentBorderColor: const Color.fromARGB(255, 131, 152, 89),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/pipe.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text("CBM", style: AccordionUtility.headerStyle),
            content: const CbmUt(),
          ),
        ],
      ),
    );
  }
} //__


