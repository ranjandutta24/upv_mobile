import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:upv_mobile/Widgets/accordion.dart';
// import 'package:upv_mobile/Widgets/example.dart';
// import 'package:upv_mobile/Widgets/example.dart';
import 'package:upv_mobile/Widgets/example2.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});
  @override
  State<OverviewScreen> createState() {
    return _OverviewsScreenState();
  }
}

class _OverviewsScreenState extends State<OverviewScreen> {
  late dynamic blastData;
  var loading = true;
  @override
  // void initState() {
  //   super.initState();
  //   blastfurnacedata();
  // }

  // late  blastData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Overview'),
        ),
        body: _acc());
  }
}

Widget _col() {
  return const Column(
    children: [
      CollapsibleWidget(
        data: "BLAST FURNACE",
      ),
      CollapsibleWidget(
        data: "BASIC OXYGEN FURNACE",
      ),
      CollapsibleWidget(
        data: "MILLS",
      ),
    ],
  );
}

Widget _acc() {
  return AccordionPage();
}
// Widget _aco() {
//   return AccordionApp();
// }
