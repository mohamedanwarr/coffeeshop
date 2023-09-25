// ignore_for_file: file_names

import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';

import '../../Widgets/HomeScreenWidgets/AppBarandTab.dart';

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
    return Scaffold(
      backgroundColor: Myconstants.darkColor,
      body: AppBarandTab(tabController: _tabController),
    );
  }
}




