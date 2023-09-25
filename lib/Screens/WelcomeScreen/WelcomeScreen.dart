import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../Componant/CustomeButton.dart';
import '../../Componant/customebackground.dart';
import '../LoginandSignup/Authcinyicate.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
          children: [
        customebackground(width: width, height: height),
        Positioned(
            top: 370,
            left: 80,
            child: Text(
              'COFFEE SHOP',
              style: TextStyle(
                  color: Myconstants.darkColor,
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  height: 0),
            )),
        Positioned(
            top: 480,
            left: 110,
            child: Text(
              'Enjoy the drink coffee .',
              style: TextStyle(
                color: Myconstants.darkColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 0.10,
              ),
            )),
        Positioned(
            top: 610,
            left: 40,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,PageTransition(
                  child: const loginandsignup(), type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds:
                  200),
                ));
              },
              child: CustomeButton(
                width: width*.8,
                height: height*0.06,
                textbutton: 'SHOP NOW',
                colorButton: Myconstants.darkColor,
                colortextButton: Myconstants.activeColor,
              ),
            ))
      ]),
    );
  }
}



