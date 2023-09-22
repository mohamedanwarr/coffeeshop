// ignore_for_file: unnecessary_null_comparison

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

class SnacBar{
  static final messagekey=GlobalKey<ScaffoldMessengerState>();
  static void showmessage(String text,{bool isuccess=false}){
    if (text == null) return;
      final snackbar= AnimatedSnackBar.material(
          text,
          type: isuccess?AnimatedSnackBarType.success:AnimatedSnackBarType.error,
        duration: const Duration(milliseconds: 4000) ,
      );
      messagekey.currentState!..removeCurrentSnackBar()..showSnackBar(snackbar as SnackBar);

  }
}