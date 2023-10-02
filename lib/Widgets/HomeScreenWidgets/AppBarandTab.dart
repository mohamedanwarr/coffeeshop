// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../Componant/CustomeMenu.dart';
import '../../constants/Constants.dart';

class AppBarandTab extends StatelessWidget {
  const AppBarandTab({
    super.key,
    TabController? tabController,
    required this.width,
    required this.height,
  }) : _tabController = tabController;

  final TabController? _tabController;
  final double width;
  final double height;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Myconstants.activeColor,
          ),
          child: Stack(
            children: [
              Positioned(
                  left: 30,
                  top: 40,
                  child: Icon(
                    FlutterIcons.search_mdi,
                    color: Myconstants.darkColor,
                    size: 30,
                  )),
              Positioned(
                  left: 70,
                  top: 40,
                  child: Text(
                    'Good day, ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Myconstants.darkColor,
                        fontWeight: FontWeight.w400),
                  )),
               const Positioned(
                right: 20,
                top: 32,
                child: PopMenu(),
              ),
              Positioned(
                  right: 75,
                  top: 32,
                  child: Icon(
                    FlutterIcons.ios_notifications_outline_ion,
                    color: Myconstants.darkColor,
                    size: 30,
                  )),
              Positioned(
                  left: 30,
                  top: 80,
                  child: Text(
                    'What would you like \nto drink today? ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Myconstants.darkColor,
                        fontWeight: FontWeight.w600),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DefaultTabController(
                      initialIndex: 0,
                      length: 5,
                      child: TabBar(
                        controller: _tabController,
                        physics: const BouncingScrollPhysics(
                            decelerationRate: ScrollDecelerationRate.normal),
                        isScrollable: true,
                        indicatorPadding: const EdgeInsets.all(5),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            color: Myconstants.darkColor,
                            borderRadius: BorderRadius.circular(
                              15.0,
                            )),
                        labelColor: Myconstants.activeColor,
                        unselectedLabelColor: Myconstants.darkColor,
                        indicatorColor: Myconstants.darkColor,
                        tabs: const [
                          Tab(
                            text: 'Popular',
                          ),
                          Tab(
                            text: 'Black coffee',
                          ),
                          Tab(
                            text: 'Winter special',
                          ),
                          Tab(
                            text: 'DECAFF',
                          ),
                          Tab(
                            text: 'CHOCOLATE',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
