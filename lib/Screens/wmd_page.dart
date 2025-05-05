import 'package:flutter/material.dart';
import 'package:in.iisco.upv/Compnent/iron/accordion.dart';
import 'package:in.iisco.upv/Compnent/wmd/accordion.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

import 'package:in.iisco.upv/Widgets/main_drawer.dart';

class WMDScreen extends StatefulWidget {
  const WMDScreen({super.key, required this.data});
  final dynamic data;
  @override
  State<WMDScreen> createState() {
    return _IronsScreenState();
  }
}

class _IronsScreenState extends State<WMDScreen> {
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
          title: const Text('WMD'),
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
  return const AccordionWMD();
}
// Widget _aco() {
//   return AccordionApp();
// }
