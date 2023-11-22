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
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
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
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 53, 197, 63),
            contentBorderColor: const Color.fromARGB(255, 53, 197, 63),
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
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 162, 70, 70),
            contentBorderColor: const Color.fromARGB(255, 197, 53, 53),
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
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 213, 184, 52),
            contentBorderColor: const Color.fromARGB(255, 213, 184, 52),
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
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 52, 165, 213),
            contentBorderColor: const Color.fromARGB(255, 52, 165, 213),
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
            headerBackgroundColor: const Color.fromARGB(255, 178, 197, 53),
            contentBorderColor: const Color.fromARGB(255, 178, 197, 53),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/factory.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header:
                const Text('SINTER PLANT', style: AccordionIron.headerStyle),
            content: const SinterPlant(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 81, 174, 61),
            contentBorderColor: const Color.fromARGB(255, 131, 152, 89),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/stone-oven.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text("COKE OVENS", style: AccordionIron.headerStyle),
            content: const Coi(),
          ),
          AccordionSection(
            headerBackgroundColor: const Color.fromARGB(255, 112, 61, 174),
            contentBorderColor: const Color.fromARGB(255, 112, 61, 174),
            isOpen: false,
            contentVerticalPadding: 10,
            leftIcon: Image.asset(
              'assets/icon/innovation.png',
              width: 40.0,
              height: 40.0,
            ),
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            header: const Text("BY PRODUCT PLANT",
                style: AccordionIron.headerStyle),
            content: const Bppi(),
          ),
          AccordionSection(
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 149, 152, 101),
            contentBorderColor: const Color.fromARGB(255, 149, 152, 101),
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
            headerPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            headerBackgroundColor: const Color.fromARGB(255, 139, 182, 99),
            contentBorderColor: const Color.fromARGB(255, 139, 182, 99),
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


