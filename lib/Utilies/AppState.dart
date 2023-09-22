import 'package:coffeeshop/Providers/LoginandSignuproviders.dart';
import 'package:coffeeshop/Screens/WelcomeScreen/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../MainScreen.dart';
import '../Models/UserModel.dart';
import '../constants/Constants.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authservices = Provider.of<LoginandSignup>(context);
    return StreamBuilder<User?>(
        stream: authservices.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: Myconstants.darkColor,
                secondRingColor: Myconstants.activeColor,
                size: 40,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            if (user == null) {
              return const WelcomeScreen();
            } else {
              return authservices.isloading
                  ? LoadingAnimationWidget.discreteCircle(
                      color: Myconstants.darkColor,
                      secondRingColor: Myconstants.activeColor,
                      size: 40,
                    )
                  : const MainScreen();
            }
          }
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Myconstants.darkColor,
              secondRingColor: Myconstants.activeColor,
              size: 40,
            ),
          );
        });
  }
}
