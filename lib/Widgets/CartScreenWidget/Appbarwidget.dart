import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../Componant/CustomeMenu.dart';
import '../../constants/Constants.dart';
class AppBarCart extends StatelessWidget {
  const AppBarCart({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.21,
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
              right: 75,
              top: 32,
              child: Icon(
                FlutterIcons.ios_notifications_outline_ion,
                color:Myconstants.darkColor,
                size: 30,
              )),
          Positioned(
              left: 30,
              top: 90,
              child: Text(
                'Cart ',
                style: TextStyle(
                    fontSize: 18,
                    color: Myconstants.darkColor,
                    fontWeight: FontWeight.w600),
              )),
          Positioned(
              left: 30,
              top: 129,
              child: Icon(
                FlutterIcons.shoppingcart_ant,
                size: 30,
                color: Myconstants.darkColor,
              )),
          Positioned(
            right: 0,
            top: 120,
            child: DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: TabBar(
                controller: _tabController,
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.normal),
                isScrollable: true,
                indicatorPadding: const EdgeInsets.all(9),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Myconstants.darkColor,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                labelColor: Myconstants.activeColor,
                unselectedLabelColor: Myconstants.darkColor,
                indicatorColor: Myconstants.darkColor,
                tabs: const [
                  Tab(
                    text: 'Recently',
                  ),
                  Tab(
                    text: 'Past Orders',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}