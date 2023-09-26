// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../Componant/CustomeMenu.dart';
import '../../constants/Constants.dart';
import '../../Screens/HomeScreen/BlackCoffeeScreen.dart';
import '../../Screens/HomeScreen/ChocolateScreen.dart';
import '../../Screens/HomeScreen/Decaffscreen.dart';
import '../../Screens/HomeScreen/Popularlscreen.dart';
import '../../Screens/HomeScreen/WinterspecialScreen.dart';
class AppBarandTab extends StatelessWidget {
  const AppBarandTab({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.26,
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
                const Positioned(right: 20, top: 32, child: PopMenu()),
              Positioned(
                  right: 75, top: 32,
                  child: SizedBox(
                    width: 25,
                    height: 34,

                    child: Image.asset('Assets/Icons/clarity_notification-solid-badged.png'),
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
                        physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.normal),
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
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.255),
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
            ]
            ),
          ),
        )

      ],
    );
  }
}