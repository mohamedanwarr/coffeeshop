import 'package:flutter/material.dart';

import '../../Componant/CustomeButton.dart';
import '../../Componant/CustomeTextfiled.dart';
import '../../Componant/customebackground.dart';
import '../../constants/Constants.dart';

class Foregetpass extends StatefulWidget {
  const Foregetpass({Key? key}) : super(key: key);

  @override
  State<Foregetpass> createState() => _ForegetpassState();
}

class _ForegetpassState extends State<Foregetpass> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        customebackground(
          width: width,
          height: height,
        ),
        Positioned(
            top: 330,
            left: 20,
            right: 50,
            child:
                Text('Please enter the email address linked with your account',
                    textAlign: TextAlign.justify,
                    strutStyle: StrutStyle.disabled,
                    style: TextStyle(
                      color: Myconstants.darkColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ))),
        Positioned(
          top: 430,
          left: 20,
          right: 20,
          child: CustomeTextfiled(
            textlablee: 'Email',
            textInput: TextInputType.emailAddress,
            obscureText: false,
            controller: _emailController,
          ),
        ),
        Positioned(
            top: 550,
            left: 40,
            right: 40,
            child: CustomeButton(
              width: width,
              height: height * 0.06,
              textbutton: 'SEND',
              colorButton: Myconstants.darkColor,
              colortextButton: Myconstants.activeColor,
            )),
        Positioned(
          bottom: 5,
          left: 100,
          right: 100,
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Remember Password ?",
                style: TextStyle(
                    color: Myconstants.darkColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 0),
              )),
        )
      ]),
    );
  }
}
