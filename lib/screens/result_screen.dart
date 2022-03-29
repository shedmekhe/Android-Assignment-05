// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment_5/helpers/constants.dart';
import 'package:assignment_5/models/bmi_calculator.dart';
import 'package:assignment_5/models/input_class.dart';
import 'package:assignment_5/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  CalculatorBrain calculatorBrain = CalculatorBrain(
    height: int.parse(InputClass.height),
    weight: int.parse(InputClass.weight),
  );

  String result = "", interpretation = "", bmi = "";

  @override
  void initState() {
    print(InputClass.height);
    print(InputClass.weight);
    CalculatorBrain calculatorBrain = CalculatorBrain(
      height: int.parse(InputClass.height),
      weight: int.parse(InputClass.weight),
    );
    bmi = calculatorBrain.calculateBMI();

    result = calculatorBrain.getResults();
    interpretation = calculatorBrain.getInterpretation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bmi = calculatorBrain.calculateBMI();

    IconData iconPro() {
      return calculatorBrain.getEmoji() == 'surprise'
          ? FontAwesomeIcons.surprise
          : calculatorBrain.getEmoji() == 'frownOpen'
              ? FontAwesomeIcons.frownOpen
              : FontAwesomeIcons.grin;
    }

    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: kBlackColorShade,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result,
            style: TextStyle(
              color: Colors.greenAccent,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          SizedBox(height: 40),
          Icon(
            iconPro(),
            size: 80.0,
            color: Colors.red,
          ),
          SizedBox(height: 40),
          Text(
            bmi,
            style: TextStyle(
              color: Colors.white,
              fontSize: 90,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0),
            child: Text(
              interpretation,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 80),
          MyButton(
            size: MediaQuery.of(context).size,
            onSubmit: () {
              Navigator.pop(context);
            },
            text: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
