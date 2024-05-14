import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Compnent/utility/BOF_gas_holder.dart';

import 'package:in.iisco.upv/Compnent/utility/CBM.dart';
import 'package:in.iisco.upv/Compnent/utility/Compressed_air.dart';
import 'package:in.iisco.upv/Compnent/utility/Gas_utility.dart';
import 'package:in.iisco.upv/Compnent/utility/Lime_dolo_calcination_plant.dart';
import 'package:in.iisco.upv/Compnent/utility/Oxygen_plant.dart';
import 'package:in.iisco.upv/Compnent/utility/Power_blowing_station_utility.dart';

class AccordionUtility extends StatefulWidget {
  static const headerStyle = TextStyle(
      color: Color.fromARGB(255, 56, 56, 56),
      fontSize: 18,
      fontWeight: FontWeight.bold);
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
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 173, 191, 227),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 173, 191, 227),
            contentBorderColor: const Color.fromARGB(255, 173, 191, 227),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/power-plant.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text('POWER & BLOWING STATION',
                style: AccordionUtility.headerStyle),
            content: const PbsUt(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 114, 176, 118),
            headerBackgroundColorOpened: const Color.fromARGB(255, 83, 156, 88),
            contentBorderColor: const Color.fromARGB(255, 92, 170, 97),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/gas-bottle.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text('BOF Gas Holder',
                style: AccordionUtility.headerStyle),
            content: const BofGasHoldUt(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 193, 184, 79),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 190, 180, 64),
            contentBorderColor: const Color.fromARGB(255, 178, 197, 53),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/online.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header:
                const Text('Gas Utlity', style: AccordionUtility.headerStyle),
            content: const GasUt(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(184, 122, 202, 193),
            headerBackgroundColorOpened:
                const Color.fromARGB(184, 85, 171, 161),
            contentBorderColor: const Color.fromARGB(184, 109, 202, 191),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/home.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text('Compressed Air Station',
                style: AccordionUtility.headerStyle),
            content: const CasUt(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 203, 161, 97),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 169, 130, 71),
            contentBorderColor: const Color.fromARGB(255, 197, 163, 53),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/tank.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header:
                const Text("OXYGEN PLANT", style: AccordionUtility.headerStyle),
            content: const OxygenPlantUt(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 210, 150, 150),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 223, 136, 136),
            contentBorderColor: const Color.fromARGB(255, 210, 150, 150),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/LDCP.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("LIME & DOLO CALCINATION PLANT",
                style: AccordionUtility.headerStyle),
            content: const LdcpUt(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 169, 181, 123),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 179, 196, 108),
            contentBorderColor: const Color.fromARGB(255, 169, 181, 123),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/pipe.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("CBM", style: AccordionUtility.headerStyle),
            content: const CbmUt(),
          ),
        ],
      ),
    );
  }
} //__

Widget _rightIcon() {
  return const Icon(
    Icons.arrow_drop_down,
    size: 35,
    color: Color.fromARGB(255, 69, 69, 69),
  );
}
