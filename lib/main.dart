// ignore_for_file: depend_on_referenced_packages

import 'package:coffeeshop/Providers/CartProviders.dart';
import 'package:coffeeshop/Utilies/snackbar.dart';
import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/FavroateProviders.dart';
import 'Providers/LoginandSignuproviders.dart';
import 'Providers/MainScreenProviders.dart';
import 'Utilies/AppState.dart' show AuthWrapper;
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack,overlays: [
  //   SystemUiOverlay.bottom
  // ]);


  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginandSignup()),
    ChangeNotifierProvider(create: (_) => MainScreenProvider()),
    ChangeNotifierProvider(create: (_) =>favor()),
    ChangeNotifierProvider(create: (_) =>cartprovider()),
  ], child: const CoffeeShop()));
}

class CoffeeShop extends StatefulWidget {
  const CoffeeShop({super.key});

  @override
  State<CoffeeShop> createState() => _CoffeeShopState();
}

class _CoffeeShopState extends State<CoffeeShop> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
      SystemUiOverlay.top,
    ]);
  }
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
      home: const AuthWrapper(),
    );
  }
}
