import 'dart:async';

import 'package:flutter/material.dart';

// class MyLoader extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DotDotDotLoader();
//   }
// }

class MyLoader extends StatefulWidget {
  const MyLoader({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyLoaderState createState() => _MyLoaderState();
}

class _MyLoaderState extends State<MyLoader> {
  int dotCount = 5;
  int currentDot = 0;
  late Timer _timer;
  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer in the dispose method.
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        currentDot = (currentDot + 1) % dotCount;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotCount, (index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: AnimatedDot(index: index, currentDot: currentDot),
        );
      }),
    );
  }
}

class AnimatedDot extends StatelessWidget {
  final int index;
  final int currentDot;

  AnimatedDot({required this.index, required this.currentDot});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == currentDot ? Colors.blue : Colors.grey,
      ),
    );
  }
}
