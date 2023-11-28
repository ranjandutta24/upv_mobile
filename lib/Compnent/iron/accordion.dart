import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:upv_mobile/Compnent/iron/BF_stock_house.dart';
import 'package:upv_mobile/Compnent/iron/Blast_furnace_iron.dart';
import 'package:upv_mobile/Compnent/iron/By_product_plant_iron.dart';
import 'package:upv_mobile/Compnent/iron/Cdcp_iron.dart';
import 'package:upv_mobile/Compnent/iron/Coke_oven_complex.dart';
import 'package:upv_mobile/Compnent/iron/Coke_ovens_iron.dart';
import 'package:upv_mobile/Compnent/iron/Gcp_trtg.dart';
import 'package:upv_mobile/Compnent/iron/Sinter_plant_iron.dart';
import 'package:upv_mobile/Compnent/iron/Stoves.dart';

//import 'package:upv_mobile/Compnent/overview/Blast_furnace.dart';

class AccordionIron extends StatefulWidget {
  static const headerStyle = TextStyle(
      color: Color.fromARGB(255, 56, 56, 56),
      fontSize: 18,
      fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

  const AccordionIron({
    Key? key,
    // required this.blastData,
  }) : super(key: key);

  // final blastData;

  @override
  State<AccordionIron> createState() => _AccordionPageState();
}

Widget _rightIcon() {
  return const Icon(
    Icons.arrow_drop_down,
    size: 35,
    color: Color.fromARGB(255, 69, 69, 69),
  );
}

class _AccordionPageState extends State<AccordionIron> {
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
            // leftIcon: const Icon(Icons.fullscreen, color: Colors.white),
            leftIcon: Image.asset(
              'assets/icon/furnace.png',
              width: 40.0,
              height: 40.0,
            ),
            header:
                const Text("BLAST FURNACE", style: AccordionIron.headerStyle),
            content: const Bfi(),
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
              'assets/icon/natural-gas.png',
              width: 40.0,
              height: 40.0,
            ),
            header: const Text("STOVES", style: AccordionIron.headerStyle),
            content: const Stoves(),
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
            // leftIcon: const Icon(Icons.fullscreen, color: Colors.white),
            leftIcon: Image.asset(
              'assets/icon/warehouse.png',
              width: 40.0,
              height: 40.0,
            ),
            header:
                const Text("BF STOCK HOUSE", style: AccordionIron.headerStyle),
            content: const Bfsh(),
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
            // leftIcon: const Icon(Icons.fullscreen, color: Colors.white),
            leftIcon: Image.asset(
              'assets/icon/gas.png',
              width: 40.0,
              height: 40.0,
            ),
            header: const Text("GCP & TRTG", style: AccordionIron.headerStyle),
            content: const Gcp(),
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
              'assets/icon/factory.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header:
                const Text('SINTER PLANT', style: AccordionIron.headerStyle),
            content: const SinterPlant(),
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
              'assets/icon/stone-oven.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("COKE OVENS", style: AccordionIron.headerStyle),
            content: const Coi(),
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
              'assets/icon/innovation.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            header: const Text("BY PRODUCT PLANT",
                style: AccordionIron.headerStyle),
            content: const Bppi(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 213, 187, 130),
            headerBackgroundColorOpened:
                const Color.fromARGB(255, 220, 187, 115),
            contentBorderColor: const Color.fromARGB(255, 189, 171, 92),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            // leftIcon: const Icon(Icons.fullscreen, color: Colors.white),
            leftIcon: Image.asset(
              'assets/icon/CDCP.png',
              width: 40.0,
              height: 40.0,
            ),
            header: const Text("CDCP", style: AccordionIron.headerStyle),
            content: const Cdcp(),
          ),
          AccordionSection(
            rightIcon: _rightIcon(),
            paddingBetweenClosedSections: 5,
            paddingBetweenOpenSections: 5,
            headerPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 194, 204, 106),
            contentBorderColor: const Color.fromARGB(255, 204, 212, 52),
            isOpen: false,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            // leftIcon: const Icon(Icons.fullscreen, color: Colors.white),
            leftIcon: Image.asset(
              'assets/icon/Complex.png',
              width: 40.0,
              height: 40.0,
            ),
            header: const Text("COKE OVEN #11 COMPLEX",
                style: AccordionIron.headerStyle),
            content: const Coc(),
          ),
        ],
      ),
    );
  }
} //__


