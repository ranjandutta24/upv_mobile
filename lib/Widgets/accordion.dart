import 'dart:async';
import 'dart:convert';

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upv_mobile/Compnent/Blast_furnace.dart';
import 'package:upv_mobile/Compnent/Basic_oxygen_furnace.dart';
import 'package:upv_mobile/Services/service_page.dart';
import 'package:upv_mobile/Widgets/ex3.dart';

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
        headerBorderColor: Colors.blueGrey,
        headerBorderColorOpened: Colors.transparent,
        // headerBorderWidth: 1,
        headerBackgroundColorOpened: const Color.fromARGB(255, 55, 114, 209),
        // headerBackgroundColorOpened: Colors.green,
        contentBackgroundColor: Colors.white,
        // contentBorderColor: Colors.green,
        contentBorderWidth: 2,
        contentHorizontalPadding: 0,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: [
          AccordionSection(
            isOpen: true,
            contentVerticalPadding: 10,
            contentHorizontalPadding: 0,
            leftIcon: const Icon(Icons.bolt_sharp, color: Colors.white),
            header:
                const Text('BLAST FURNACE', style: AccordionPage.headerStyle),
            content: const Col(),
          ),
          AccordionSection(
            isOpen: false,
            leftIcon:
                const Icon(Icons.text_fields_rounded, color: Colors.white),
            header: const Text("BASIC OXYGEN FURNACE",
                style: AccordionPage.headerStyle),
            content: BOF(),
          ),
        ],
      ),
    );
  }
} //__


