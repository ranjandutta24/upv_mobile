import 'package:flutter/material.dart';

import 'package:upv_mobile/Compnent/overview/accordion.dart';

import 'package:upv_mobile/Widgets/main_drawer.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key, required this.data});
  final data;
  @override
  State<OverviewScreen> createState() {
    return _OverviewsScreenState();
  }
}

class _OverviewsScreenState extends State<OverviewScreen> {
  late dynamic blastData;
  var loading = true;

  // void initState() {
  //   super.initState();
  //   blastfurnacedata();
  // }

  // late  blastData;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: MainDrawer(
          data: widget.data,
        ),
        body: _accordion());
  }
}

Widget _accordion() {
  return const AccordionPage();
}
// Widget _aco() {
//   return AccordionApp();
// }
