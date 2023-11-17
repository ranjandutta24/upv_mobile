import 'package:flutter/material.dart';
import 'package:upv_mobile/Compnent/iron/accordion.dart';

import 'package:upv_mobile/Widgets/main_drawer.dart';

class IronScreen extends StatefulWidget {
  const IronScreen({super.key});
  @override
  State<IronScreen> createState() {
    return _IronsScreenState();
  }
}

class _IronsScreenState extends State<IronScreen> {
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
          title: const Text('Iron'),
        ),
        drawer: const MainDrawer(),
        body: _accordion());
  }
}

Widget _accordion() {
  return AccordionIron();
}
// Widget _aco() {
//   return AccordionApp();
// }