import 'dart:async';
import 'package:flutter/material.dart';
import 'package:juicejuice/register.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Second3()));
    });
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Column(
          children: [
            Center(
                child: Padding(
              padding: EdgeInsets.only(top: 250),
              child: Text(
                'JUICE',
                style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20),
              child: Text(
                'WE MAKE HEALTHY TASTY GOOD',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
