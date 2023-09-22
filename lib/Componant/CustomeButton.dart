import 'package:flutter/material.dart';

import '../constants/Constants.dart';
class CustomeButton extends StatelessWidget {
  const CustomeButton({
    super.key,
    required this.textbutton,
    required this.colorButton,
    required this.colortextButton,
    this.width,
    this.height,
  });

  final String textbutton;
  final Color colorButton;
  final Color colortextButton;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Myconstants.darkColor),
        color: colorButton,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(
        textbutton,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: colortextButton,
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 3,
        ),
      ),
    );
  }
}
