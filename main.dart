import 'package:flutter/material.dart';

import 'first.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
