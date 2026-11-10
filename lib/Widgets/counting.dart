import 'package:flutter/material.dart';

class Counting extends StatefulWidget {
  const Counting({super.key, required this.value, required this.color});
  final dynamic value;
  final Color color;
  @override
  State<Counting> createState() {
    return _CountingState();
  }
}

class _CountingState extends State<Counting> {
  double _parseVal(dynamic v) {
    if (v == null) return 0.0;
    if (v is num) return v.toDouble();
    return double.tryParse(v.toString()) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(
          begin: 0.0,
          end: _parseVal(widget.value)),
          // end: widget.value
          //     .toDouble()), // Animate between old and new double values
      duration: const Duration(seconds: 1), // Duration of the animation
      builder: (context, value, child) {
        return Text(
          value.toStringAsFixed(
              2), // Display the current animated value with 1 decimal place
          textAlign: TextAlign.center,
          style: TextStyle(
            color: widget.color, // Replace with your color variable
            fontWeight: FontWeight.w600,
          ),
        );
      },
    );
  }
}
