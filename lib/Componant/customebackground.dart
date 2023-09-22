import 'package:flutter/material.dart';
class customebackground extends StatelessWidget {
  const customebackground({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity(),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("Assets/Images/welcomeimage.png"))),
      ),
    );
  }
}