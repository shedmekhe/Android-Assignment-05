// ignore_for_file: prefer_const_constructors

import 'package:assignment_5/helpers/constants.dart';
import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  const GenderContainer({
    Key? key,
    required this.isActive,
    required this.icon,
    required this.onGenderChange,
  }) : super(key: key);
  final bool isActive;
  final IconData icon;
  final Function onGenderChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onGenderChange();
          },
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: isActive ? kGreenColorShade : Colors.black,
              borderRadius: BorderRadius.circular(300),
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.black : Colors.white,
              size: 40,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          icon == Icons.male ? "Male" : "Female",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
