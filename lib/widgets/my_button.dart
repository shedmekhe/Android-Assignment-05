// ignore_for_file: prefer_const_constructors

import 'package:assignment_5/helpers/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.size,
    required this.onSubmit,
    required this.text,
  }) : super(key: key);

  final Size size;
  final Function onSubmit;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSubmit();
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: kGreenColorShade,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
