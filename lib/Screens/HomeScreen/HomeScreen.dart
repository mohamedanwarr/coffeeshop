// ignore_for_file: file_names

import 'package:coffeeshop/Screens/HomeScreen/BlackCoffeeScreen.dart';
import 'package:coffeeshop/Screens/HomeScreen/ChocolateScreen.dart';
import 'package:coffeeshop/Screens/HomeScreen/Decaffscreen.dart';
import 'package:coffeeshop/Screens/HomeScreen/WinterspecialScreen.dart';
import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';

import '../../Widgets/HomeScreenWidgets/AppBarandTab.dart';
import 'Popularlscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
  TabController(length: 5, vsync: this);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
        backgroundColor: Myconstants.darkColor,
        body: Stack(children: [
          AppBarandTab(  width:width,tabController: _tabController,
            height: height * 0.26,),
          Padding(
            padding:
            EdgeInsets.only(top: height * 0.237),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),
                child: TabBarView(controller: _tabController, children: const [
                  Popularscreen(),
                  BlackCoffee(),
                  WinterSpecial(),
                  DecaffCoffee(),
                  ChocolateCoffee(),
                ]),
              ),
            ),
          )
        ]));
  }
}
