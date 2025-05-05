import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Compnent/iron/BF_stock_house.dart';
import 'package:in.iisco.upv/Compnent/iron/Blast_furnace_iron.dart';
import 'package:in.iisco.upv/Compnent/iron/By_product_plant_iron.dart';
import 'package:in.iisco.upv/Compnent/iron/Cdcp_iron.dart';
import 'package:in.iisco.upv/Compnent/iron/Coke_oven_complex.dart';
import 'package:in.iisco.upv/Compnent/iron/Coke_ovens_iron.dart';
import 'package:in.iisco.upv/Compnent/iron/Gcp_trtg.dart';
import 'package:in.iisco.upv/Compnent/iron/Sinter_plant_iron.dart';
import 'package:in.iisco.upv/Compnent/iron/Stoves.dart';
import 'package:in.iisco.upv/Compnent/wmd/Shop_Wise_Water_Supply_Monitoring.dart';
import 'package:in.iisco.upv/Compnent/wmd/Water_Management_Department.dart';

//import 'package:in.iisco.upv/Compnent/overview/Blast_furnace.dart';

class AccordionWMD extends StatefulWidget {
  static const headerStyle = TextStyle(
      color: Color.fromARGB(255, 56, 56, 56),
      fontSize: 18,
      fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

  const AccordionWMD({
    Key? key,
    // required this.blastData,
  }) : super(key: key);

  // final blastData;

  @override
  State<AccordionWMD> createState() => _AccordionPageState();
}

Widget _rightIcon() {
  return const Icon(
    Icons.arrow_drop_down,
    size: 35,
    color: Color.fromARGB(255, 69, 69, 69),
  );
}

class _AccordionPageState extends State<AccordionWMD> {
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
              'assets/icon/pipe.png',
              width: 40.0,
              height: 40.0,
            ),
            header: const Text("Water Managment Department",
                style: AccordionWMD.headerStyle),
            content: const wmd(),
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
            header: const Text("Shop Wise Water Supply Monitoring",
                style: AccordionWMD.headerStyle),
            content: const swwsm(),
          ),
        ],
      ),
    );
  }
} //__
