import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upv_mobile/Screens/log_page2.dart';
import 'package:upv_mobile/Screens/overview_page.dart';
import 'package:upv_mobile/Widgets/loader.dart';
import 'package:upv_mobile/providers/user.dart';

class Init extends ConsumerStatefulWidget {
  const Init({super.key});

  @override
  ConsumerState<Init> createState() => _InitState();
}

class _InitState extends ConsumerState<Init>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  dynamic userinfo;
  dynamic orginfo;
  dynamic ainfo;

  @override
  void initState() {
    super.initState();
    check();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  check() async {
    userinfo = await ref.read(userProvider.notifier).loadUser();
    // print(userinfo);
    // print(userinfo[0]["userid"]);
    userinfo.isEmpty
        // ignore: use_build_context_synchronously
        ? Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const Login(),
            ),
          )
        // ignore: use_build_context_synchronously
        : Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const OverviewScreen(),
            ),
          );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 130,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "UPV Sail",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          // MyLoader(),
          Container(
            padding: const EdgeInsets.all(20),
            child: LinearProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 26, 69, 128)), // Change color here
              backgroundColor:
                  Colors.grey[300], // Optional: Change background color
            ),
          )
        ],
      ),
    );
    // return Login();
  }
}
