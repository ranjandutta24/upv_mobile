import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

import 'package:upv_mobile/Compnent/overview/Blast_furnace.dart';
import 'package:upv_mobile/Compnent/overview/Basic_oxygen_furnace.dart';
import 'package:upv_mobile/Compnent/overview/CBM.dart';
import 'package:upv_mobile/Compnent/overview/Coke_ovens.dart';
import 'package:upv_mobile/Compnent/overview/Continuous_casting_plant.dart';
import 'package:upv_mobile/Compnent/overview/Ladle_heating_furnace.dart';
import 'package:upv_mobile/Compnent/overview/Mills.dart';
import 'package:upv_mobile/Compnent/overview/Power_blowing_station.dart';
import 'package:upv_mobile/Compnent/overview/Sinter_plant.dart';
import 'package:upv_mobile/Compnent/overview/Techno_economics.dart';
import 'package:upv_mobile/Compnent/overview/overview.dart';

class AccordionPage extends StatefulWidget {
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
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
        children: [
          AccordionSection(
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: const Icon(Icons.bolt_sharp, color: Colors.white),
            header: const Text('Overview', style: AccordionPage.headerStyle),
            content: const Overview(),
          ),
          AccordionSection(
            headerBackgroundColor: Color.fromARGB(255, 53, 197, 63),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: const Icon(Icons.fullscreen, color: Colors.white),
            header:
                const Text("BLAST FURNACE", style: AccordionPage.headerStyle),
            content: const Col(),
          ),
          AccordionSection(
            headerBackgroundColor: Color.fromARGB(255, 178, 197, 53),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header:
                const Text("SINTER PLANT", style: AccordionPage.headerStyle),
            content: const SinterPlant(),
          ),
          AccordionSection(
            headerBackgroundColor: Color.fromARGB(255, 53, 197, 180),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: const Icon(Icons.fullscreen, color: Colors.white),
            header: const Text("BASIC OXYGEN FURNACE",
                style: AccordionPage.headerStyle),
            content: const BOF(),
          ),
          AccordionSection(
            headerBackgroundColor: Color.fromARGB(255, 197, 163, 53),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header: const Text("CONTINUOUS CASTING PLANT",
                style: AccordionPage.headerStyle),
            content: const Ccp(),
          ),
          AccordionSection(
            headerBackgroundColor: Color.fromARGB(255, 158, 89, 129),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header: const Text("LADLE HEATING FURNACE",
                style: AccordionPage.headerStyle),
            content: const Lhf(),
          ),
          AccordionSection(
            headerBackgroundColor: Color.fromARGB(255, 131, 152, 89),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header: const Text("MILLS", style: AccordionPage.headerStyle),
            content: Mills(),
          ),
          AccordionSection(
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header: const Text("POWER & BLOWING STATION",
                style: AccordionPage.headerStyle),
            content: const Pbs(),
          ),
          AccordionSection(
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header:
                const Text("OXYGEN PLANT", style: AccordionPage.headerStyle),
            content: const Cbm(),
          ),
          AccordionSection(
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header: const Text("CBM", style: AccordionPage.headerStyle),
            content: const Cbm(),
          ),
          AccordionSection(
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header: const Text("COKE OVENS", style: AccordionPage.headerStyle),
            content: const CokeOvens(),
          ),
          AccordionSection(
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header: const Text("BY PRODUCT PLANT",
                style: AccordionPage.headerStyle),
            content: const CokeOvens(),
          ),
          AccordionSection(
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
            header: const Text("LIME & DOLO CALCINATION PLANT",
                style: AccordionPage.headerStyle),
            content: const CokeOvens(),
          ),
          AccordionSection(
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: const Icon(Icons.bar_chart_sharp, color: Colors.white),
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


