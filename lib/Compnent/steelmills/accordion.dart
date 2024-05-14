import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

import 'package:in.iisco.upv/Compnent/steelmills/Basic_oxygen_furnace.dart';
import 'package:in.iisco.upv/Compnent/steelmills/Continuous_casting_plant.dart';
import 'package:in.iisco.upv/Compnent/steelmills/Crane_ladle_weight.dart';
import 'package:in.iisco.upv/Compnent/steelmills/Ladle_heating_furnace.dart';
import 'package:in.iisco.upv/Compnent/steelmills/Mills.dart';
import 'package:in.iisco.upv/Compnent/steelmills/Torpedo_at_hmrs.dart';

class AccordionSteel extends StatefulWidget {
  static const headerStyle = TextStyle(
      color: Color.fromARGB(255, 56, 56, 56),
      fontSize: 18,
      fontWeight: FontWeight.bold);
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

Widget _rightIcon() {
  return const Icon(
    Icons.arrow_drop_down,
    size: 35,
    color: Color.fromARGB(255, 69, 69, 69),
  );
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
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 173, 191, 227),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 173, 191, 227),
            contentBorderColor: const Color.fromARGB(255, 173, 191, 227),
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
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 114, 176, 118),
            headerBackgroundColorOpened: const Color.fromARGB(255, 83, 156, 88),
            contentBorderColor: const Color.fromARGB(255, 92, 170, 97),
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
            content: const Hmrs(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 193, 184, 79),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 190, 180, 64),
            contentBorderColor: const Color.fromARGB(255, 178, 197, 53),
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
            content: const clwsm(),
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
            leftIcon: Image.asset(
              'assets/icon/casting.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("CONTINUOUS CASTING PLANT",
                style: AccordionSteel.headerStyle),
            content: const Ccpsm(),
            // content: Text(
            //     "sdssjhh sdfkjhskjfhks dk sfsdhgkew ertet et etett w "),
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
              'assets/icon/fire-place.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("LADLE HEATING FURNACE",
                style: AccordionSteel.headerStyle),
            content: const Lhfsm(),
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
              'assets/icon/milling-machine.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("MILLS", style: AccordionSteel.headerStyle),
            content: const Millssm(),
          ),
        ],
      ),
    );
  }
} //__


