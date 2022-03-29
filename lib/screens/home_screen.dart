// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:assignment_5/helpers/constants.dart';
import 'package:assignment_5/models/input_class.dart';
import 'package:assignment_5/screens/result_screen.dart';
import 'package:assignment_5/widgets/gender_container.dart';
import 'package:assignment_5/widgets/height_weight_column.dart';
import 'package:assignment_5/widgets/my_alert_box.dart';
import 'package:assignment_5/widgets/my_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isActive = true;
  int _age = 20;

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _heightEditingController =
      TextEditingController();
  final TextEditingController _weightEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   //kBlackColorShade
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "BMI Checker",
          style: TextStyle(color: kGreenColorShade, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Your Gender?",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  GenderContainer(
                    isActive: isActive,
                    icon: Icons.male,
                    onGenderChange: () {
                      setState(() {
                        isActive = !isActive;
                        InputClass.gender = isActive;
                      });
                    },
                  ),
                  SizedBox(width: 30),
                  GenderContainer(
                    isActive: !isActive,
                    icon: Icons.female,
                    onGenderChange: () {
                      setState(() {
                        isActive = !isActive;
                        InputClass.gender = isActive;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 40),
              Divider(color: kGreenColorShade),
              SizedBox(height: 40),
              Text(
                "Your Age?",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return MyAlertBox(
                              textEditingController: _textEditingController,
                              text: "age");
                        },
                      );
                    },
                    child: AnimatedFlipCounter(
                      duration: Duration(milliseconds: 500),
                      value: InputClass.age == "-1"
                          ? _age
                          : int.parse(InputClass.age),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _age += 1;
                          });
                        },
                        child:
                            Icon(Icons.add, color: kGreenColorShade, size: 50),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _age -= 1;
                          });
                        },
                        child: Icon(Icons.remove,
                            color: kGreenColorShade, size: 50),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Divider(color: kGreenColorShade),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeightWeightColumns(
                    textEditingController: _heightEditingController,
                    text: 'height',
                    value: InputClass.height,
                    unit: ' cm',
                  ),
                  HeightWeightColumns(
                    textEditingController: _weightEditingController,
                    text: 'weight',
                    value: InputClass.weight,
                    unit: ' kg',
                  ),
                ],
              ),
              SizedBox(height: 40),
              MyButton(
                size: size,
                onSubmit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(),
                    ),
                  );
                },
                text: 'CALCULATE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
