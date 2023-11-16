import 'package:flutter/material.dart';
import 'package:upv_mobile/Compnent/iron/accordion.dart';
import 'package:upv_mobile/Compnent/steelmills/accordion.dart';

import 'package:upv_mobile/Widgets/main_drawer.dart';

class SteelMillsScreen extends StatefulWidget {
  const SteelMillsScreen({super.key});
  @override
  State<SteelMillsScreen> createState() {
    return _SteelMillssScreenState();
  }
}

class _SteelMillssScreenState extends State<SteelMillsScreen> {
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
          title: const Text('Steel/Mills'),
        ),
        drawer: const MainDrawer(),
        body: _accordion());
  }
}

Widget _accordion() {
  return AccordionSteel();
}
// Widget _aco() {
//   return AccordionApp();
// }
