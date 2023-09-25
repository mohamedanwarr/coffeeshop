// ignore_for_file: unnecessary_null_comparison

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';

class SnacBar {
  static final messagekey = GlobalKey<ScaffoldMessengerState>();

  static void showmessage(String text, {bool isuccess = false}) {
    if (text == null) return;
    final snackbar = SnackBar(

      behavior: SnackBarBehavior.floating,
      // padding: const EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: AwesomeSnackbarContent(

        inMaterialBanner: true,
        titleFontSize: 15,
        messageFontSize: 12,
       title: isuccess?'Congratulation':'On Snap!',
        message: text,
        contentType: isuccess ? ContentType.success : ContentType.failure,
        color: isuccess? Myconstants.activeColor:Myconstants.darkColor,
      ),

      duration: const Duration(milliseconds: 4000),
    );
    messagekey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackbar);
  }
}
