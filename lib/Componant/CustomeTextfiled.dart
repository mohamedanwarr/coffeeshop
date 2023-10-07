import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';

class CustomeTextfiledlogin extends StatelessWidget {
   CustomeTextfiledlogin({
    super.key,
     required this.textlablee, required this.textInput, required this.obscureText,required this.controller, this.validator,
  });


  final String textlablee;
  final TextInputType textInput;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: obscureText,
          autofocus: false,
          controller: controller,
          textInputAction: TextInputAction.done,
          keyboardType: textInput,
          decoration: InputDecoration(
            label: Text(
              textlablee,
            ),
            labelStyle: TextStyle(
              fontSize: 18,
              color: Myconstants.darkColor,
              fontWeight: FontWeight.w500,
              height: 0.10,
            ),
          ),
          validator:validator
        ),
      ],
    );
  }
}