// ignore_for_file: depend_on_referenced_packages

import 'package:coffeeshop/Utilies/snackbar.dart';
import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/LoginandSignuproviders.dart';
import 'Providers/MainScreenProviders.dart';
import 'Screens/WelcomeScreen/WelcomeScreen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginandSignup()),
    ChangeNotifierProvider(create: (_) => MainScreenProvider()),
  ], child: const CoffeeShop()));
}

class CoffeeShop extends StatelessWidget {
  const CoffeeShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: SnacBar.messagekey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Myconstants.darkColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
    );
  }
}
