import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:upv_mobile/Widgets/accordion.dart';
// import 'package:upv_mobile/Widgets/example.dart';
// import 'package:upv_mobile/Widgets/example.dart';
import 'package:upv_mobile/Widgets/example2.dart';
import 'package:upv_mobile/Widgets/main_drawer.dart';

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
        drawer: const MainDrawer(),
        body: _accordion());
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

Widget _accordion() {
  return AccordionPage();
}
// Widget _aco() {
//   return AccordionApp();
// }
