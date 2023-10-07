// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../Componant/CustomeMenu.dart';
import '../../constants/Constants.dart';
import 'PastOrders.dart';
import 'RecentlyScreen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Myconstants.darkColor,
      body: Stack(children: [
        AppBarCart(tabController: _tabController),
        Padding(
          padding:
              EdgeInsets.only(top: height * 0.220),
          child: Container(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
            ),
            child: TabBarView(controller: _tabController, children: const [
              RecentlyScreen(),
              PastOreders()
            ]),
          ),
        )
      ]),
    );
  }

}

class AppBarCart extends StatelessWidget {
  const AppBarCart({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.21,
      decoration: BoxDecoration(
        color: Myconstants.activeColor,
      ),
      child: Stack(
        children: [
          Positioned(
              left: 20,
              top: 18,
              child: Icon(
                FlutterIcons.search_mdi,
                color: Myconstants.darkColor,
                size: 35,
              )),
          Positioned(
              left: 75,
              top: 22,
              child: Text(
                'Good day, ',
                style: TextStyle(
                    fontSize: 18,
                    color: Myconstants.darkColor,
                    fontWeight: FontWeight.w400),
              )),
          const Positioned(right: 20, top: 15, child: PopMenu()),
          Positioned(
              right: 75,
              top: 15,
              child: Icon(
                FlutterIcons.ios_notifications_outline_ion,
                color:Myconstants.darkColor,
                size: 30,
              )),
          Positioned(
              left: 30,
              top: 70,
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
