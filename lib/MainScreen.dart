// ignore_for_file: file_names

import 'package:coffeeshop/Screens/FavoraiteScreen/FavoraitePage.dart';
import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'Componant/BottomNavigation.dart';
import 'Providers/MainScreenProviders.dart';
import 'Screens/CartScreen/CartPage.dart';
import 'Screens/HomeScreen/HomeScreen.dart';
import 'Screens/ProfileScreen/ProfilePage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pages = [
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
    const FavoraiteScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final bottonav = Provider.of<MainScreenProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          //this color must be equal to the WaterDropNavBar backgroundColor
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      child: Scaffold(
          bottomNavigationBar: Bottomnav(bottonav: bottonav),
backgroundColor: Myconstants.activeColor,
          body: pages[bottonav.pageIndex]),
    );
  }
}


