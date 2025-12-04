import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'dart:ui';

import 'package:in.iisco.upv/Compnent/overview/accordion.dart';
import 'package:in.iisco.upv/Utils/colors.dart';

import 'package:in.iisco.upv/Widgets/main_drawer.dart';
import 'package:in.iisco.upv/providers/user.dart';

class OverviewScreen extends ConsumerStatefulWidget {
  const OverviewScreen({
    super.key,
  });
  // final dynamic data;
  @override
  _OverviewsScreenState createState() => _OverviewsScreenState();
  // State<OverviewScreen> createState() {
  //   return _OverviewsScreenState();
  // }
}

class _OverviewsScreenState extends ConsumerState<OverviewScreen> {
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
    final dynamic currentUserData = ref.watch(userProvider);
    // print(currentUserData);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
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
          data: currentUserData,
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
