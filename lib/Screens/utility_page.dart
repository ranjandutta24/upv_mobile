import 'package:flutter/material.dart';

import 'package:upv_mobile/Compnent/utility/accordion.dart';

import 'package:upv_mobile/Widgets/main_drawer.dart';

class Utilitycreen extends StatefulWidget {
  const Utilitycreen({super.key});
  @override
  State<Utilitycreen> createState() {
    return _UtilityScreenState();
  }
}

class _UtilityScreenState extends State<Utilitycreen> {
  late dynamic blastData;
  var loading = true;
  @override
  // void initState() {
  //   super.initState();
  //   blastfurnacedata();
  // }

  // late  blastData;

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Utility'),
        ),
        drawer: const MainDrawer(),
        body: _accordion());
  }
}

Widget _accordion() {
  return AccordionUtility();
}
// Widget _aco() {
//   return AccordionApp();
// }
