import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:ui';

import 'package:upv_mobile/Compnent/overview/accordion.dart';
import 'package:upv_mobile/Utils/colors.dart';

import 'package:upv_mobile/Widgets/main_drawer.dart';

class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key, required this.data});
  final dynamic data;
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
          title: Text(
            'Home',
            // style: GoogleFonts.play(
            //   textStyle: const TextStyle(
            //     // color: myColors["icon"], // Change text color
            //     fontSize: 20, // Change font size
            //   ),
            // ),
          ),
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
  return const AccordionPage();
}
// Widget _aco() {
//   return AccordionApp();
// }
