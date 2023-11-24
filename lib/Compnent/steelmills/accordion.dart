import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

import 'package:upv_mobile/Compnent/steelmills/Basic_oxygen_furnace.dart';
import 'package:upv_mobile/Compnent/steelmills/Continuous_casting_plant.dart';
import 'package:upv_mobile/Compnent/steelmills/Ladle_heating_furnace.dart';
import 'package:upv_mobile/Compnent/steelmills/Mills.dart';

class AccordionSteel extends StatefulWidget {
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

  const AccordionSteel({
    Key? key,
    // required this.blastData,
  }) : super(key: key);

  // final blastData;

  @override
  State<AccordionSteel> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionSteel> {
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
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 53, 197, 180),
            contentBorderColor: const Color.fromARGB(255, 53, 197, 180),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/metallurgical-plant.png',
              width: 40.0,
              height: 40.0,
            ),
            header: const Text("BASIC OXYGEN FURNACE",
                style: AccordionSteel.headerStyle),
            content: const BOFsm(),
          ),
          AccordionSection(
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 53, 197, 180),
            contentBorderColor: const Color.fromARGB(255, 53, 197, 180),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/missile.png',
              width: 40.0,
              height: 40.0,
            ),
            header: const Text("Torpedo at HMRS",
                style: AccordionSteel.headerStyle),
            content: const BOFsm(),
          ),
          AccordionSection(
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 53, 197, 180),
            contentBorderColor: const Color.fromARGB(255, 53, 197, 180),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/weigh-scale.png',
              width: 40.0,
              height: 40.0,
            ),
            header: const Text("CRANE LADLE WEIGHT",
                style: AccordionSteel.headerStyle),
            content: const BOFsm(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 197, 163, 53),
            contentBorderColor: const Color.fromARGB(255, 197, 163, 53),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/casting.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text("CONTINUOUS CASTING PLANT",
                style: AccordionSteel.headerStyle),
            content: const Ccpsm(),
            // content: Text(
            //     "sdssjhh sdfkjhskjfhks dk sfsdhgkew ertet et etett w "),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 158, 89, 129),
            contentBorderColor: const Color.fromARGB(255, 158, 89, 129),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/fire-place.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text("LADLE HEATING FURNACE",
                style: AccordionSteel.headerStyle),
            content: const Lhfsm(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 131, 152, 89),
            contentBorderColor: const Color.fromARGB(255, 131, 152, 89),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/milling-machine.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text("MILLS", style: AccordionSteel.headerStyle),
            content: const Millssm(),
          ),
        ],
      ),
    );
  }
} //__


