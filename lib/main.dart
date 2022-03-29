// ignore_for_file: prefer_const_constructors

import 'package:assignment_5/helpers/constants.dart';
import 'package:assignment_5/screens/home_screen.dart';
import 'package:assignment_5/screens/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(primaryColor: kBlackColorShade),
      home: HomeScreen(),
    );
  }
}

