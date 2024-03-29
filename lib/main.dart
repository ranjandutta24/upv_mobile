import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upv_mobile/Screens/init_page.dart';
import 'package:upv_mobile/Screens/log_page2.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
    // const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log In',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Init(),
    );
  }
}
