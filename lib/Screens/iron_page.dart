import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Compnent/iron/accordion.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

import 'package:in.iisco.upv/Widgets/main_drawer.dart';

class IronScreen extends StatefulWidget {
  const IronScreen({super.key, required this.data});
  final dynamic data;
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
          backgroundColor: myColors["theme"],
          foregroundColor: myColors["white"],
        ),
        drawer: MainDrawer(
          data: widget.data,
        ),
        body: _accordion());
  }
}

Widget _accordion() {
  return const AccordionIron();
}
// Widget _aco() {
//   return AccordionApp();
// }
