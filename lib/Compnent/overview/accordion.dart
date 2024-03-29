import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

import 'package:upv_mobile/Compnent/overview/Blast_furnace.dart';
import 'package:upv_mobile/Compnent/overview/Basic_oxygen_furnace.dart';
import 'package:upv_mobile/Compnent/overview/By_product_plant.dart';
import 'package:upv_mobile/Compnent/overview/CBM.dart';
import 'package:upv_mobile/Compnent/overview/Coke_ovens.dart';
import 'package:upv_mobile/Compnent/overview/Continuous_casting_plant.dart';
import 'package:upv_mobile/Compnent/overview/Ladle_heating_furnace.dart';
import 'package:upv_mobile/Compnent/overview/Lime_dolo_calcination_plant.dart';
import 'package:upv_mobile/Compnent/overview/Mills.dart';
import 'package:upv_mobile/Compnent/overview/Oxygen_plant.dart';
import 'package:upv_mobile/Compnent/overview/Power_blowing_station.dart';
import 'package:upv_mobile/Compnent/overview/Sinter_plant.dart';
import 'package:upv_mobile/Compnent/overview/Techno_economics.dart';
import 'package:upv_mobile/Compnent/overview/overview.dart';

class AccordionPage extends StatefulWidget {
  static const headerStyle = TextStyle(
      color: Color.fromARGB(255, 56, 56, 56),
      fontSize: 18,
      fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

  const AccordionPage({
    Key? key,
    // required this.blastData,
  }) : super(key: key);

  // final blastData;

  @override
  State<AccordionPage> createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionPage> {
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
        // contentBorderRadius: 0,

        children: [
          AccordionSection(
            sectionClosingHapticFeedback: SectionHapticFeedback.none,
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            isOpen: false,
            headerBackgroundColor: const Color.fromARGB(255, 173, 191, 227),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 173, 191, 227),
            contentBorderColor: const Color.fromARGB(255, 173, 191, 227),
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/research.png',
              width: 40.0,
              height: 40.0,
            ),
            rightIcon: _rightIcon(),
            header: const Text('Overview', style: AccordionPage.headerStyle),
            content: const Overview(),
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
            // leftIcon: const Icon(Icons.fullscreen, color: Colors.white),
            leftIcon: Image.asset(
              'assets/icon/furnace.png',
              width: 40.0,
              height: 40.0,
            ),
            header:
                const Text("BLAST FURNACE", style: AccordionPage.headerStyle),
            content: const Col(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 4,
            paddingBetweenOpenSections: 4,
            headerBackgroundColor: const Color.fromARGB(255, 193, 184, 79),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 190, 180, 64),
            contentBorderColor: const Color.fromARGB(255, 178, 197, 53),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/factory.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header:
                const Text("SINTER PLANT", style: AccordionPage.headerStyle),
            content: const SinterPlant(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(184, 122, 202, 193),
            headerBackgroundColorOpened:
                const Color.fromARGB(184, 85, 171, 161),
            contentBorderColor: const Color.fromARGB(184, 109, 202, 191),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: Image.asset(
              'assets/icon/metallurgical-plant.png',
              width: 40.0,
              height: 40.0,
            ),
            header: const Text("BASIC OXYGEN FURNACE",
                style: AccordionPage.headerStyle),
            content: const BOF(),
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
              'assets/icon/casting.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("CONTINUOUS CASTING PLANT",
                style: AccordionPage.headerStyle),
            content: const Ccp(),
            // content: Text(
            //     "sdssjhh sdfkjhskjfhks dk sfsdhgkew ertet et etett w "),
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
              'assets/icon/fire-place.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("LADLE HEATING FURNACE",
                style: AccordionPage.headerStyle),
            content: const Lhf(),
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
              'assets/icon/milling-machine.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("MILLS", style: AccordionPage.headerStyle),
            content: const Mills(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 213, 187, 130),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 220, 187, 115),
            contentBorderColor: const Color.fromARGB(255, 189, 171, 92),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/power-plant.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("POWER & BLOWING STATION",
                style: AccordionPage.headerStyle),
            content: const Pbs(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 194, 204, 106),
            contentBorderColor: const Color.fromARGB(255, 204, 212, 52),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/oxygen-tank.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header:
                const Text("OXYGEN PLANT", style: AccordionPage.headerStyle),
            content: const OxygenPlant(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 232, 193, 103),
            contentBorderColor: const Color.fromARGB(255, 232, 193, 103),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/pipe.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("CBM", style: AccordionPage.headerStyle),
            content: const Cbm(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 133, 190, 99),
            contentBorderColor: const Color.fromARGB(255, 81, 174, 61),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/stone-oven.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("COKE OVENS", style: AccordionPage.headerStyle),
            content: const CokeOvens(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 119, 145, 183),
            contentBorderColor: const Color.fromARGB(255, 126, 159, 207),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/innovation.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("BY PRODUCT PLANT",
                style: AccordionPage.headerStyle),
            content: const Bpplant(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 199, 154, 197),
            contentBorderColor: const Color.fromARGB(255, 195, 153, 247),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/capacity.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("LIME & DOLO CALCINATION PLANT",
                style: AccordionPage.headerStyle),
            content: const Ldcp(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerBackgroundColor: const Color.fromARGB(255, 156, 144, 170),
            contentBorderColor: const Color.fromARGB(255, 161, 131, 196),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/graph.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("TECHNO ECONOMICS",
                style: AccordionPage.headerStyle),
            content: const TechnoEco(),
          ),
        ],
      ),

      // Accordion(
      //   paddingListTop: 0,
      //   paddingListBottom: 0,
      //   headerBorderColor: Colors.blueGrey,
      //   headerBorderColorOpened: Colors.transparent,
      //   // headerBorderWidth: 1,
      //   headerBackgroundColorOpened:
      //       const Color.fromARGB(255, 55, 114, 209),
      //   // headerBackgroundColorOpened: Colors.green,
      //   contentBackgroundColor: Colors.white,
      //   // contentBorderColor: Colors.green,
      //   contentBorderWidth: 2,
      //   contentHorizontalPadding: 0,
      //   scaleWhenAnimating: true,
      //   openAndCloseAnimation: true,
      //   headerPadding:
      //       const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      //   sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      //   sectionClosingHapticFeedback: SectionHapticFeedback.light,
      //   children: [
      //     AccordionSection(
      //       isOpen: false,
      //       leftIcon: const Icon(Icons.text_fields_rounded,
      //           color: Colors.white),
      //       header: const Text("TECHNO ECONOMICS",
      //           style: AccordionPage.headerStyle),
      //       content: TechnoEco(),
      //     ),
      //   ],
      // ),
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
