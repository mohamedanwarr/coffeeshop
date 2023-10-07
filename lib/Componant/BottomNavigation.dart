// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

import '../Providers/MainScreenProviders.dart';
import '../constants/Constants.dart';

class Bottomnav extends StatelessWidget {
  const Bottomnav({
    super.key,
    required this.bottonav,
  });

  final MainScreenProvider bottonav;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 8.0)
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        child: WaterDropNavBar(
          bottomPadding: 18,
          inactiveIconColor: Myconstants.darkColor,
          waterDropColor: Myconstants.darkColor,
          backgroundColor: Myconstants.activeColor,
          selectedIndex: bottonav.pageIndex,
          barItems: [
            BarItem(
                filledIcon: FlutterIcons.home_fou,
                outlinedIcon: FlutterIcons.home_ant),
            BarItem(
                filledIcon: FlutterIcons.cart_mco,
                outlinedIcon: FlutterIcons.shoppingcart_ant),
            BarItem(
                filledIcon: FlutterIcons.favorite_mdi,
                outlinedIcon: FlutterIcons.favorite_border_mdi),
            BarItem(
                filledIcon: FlutterIcons.person_mdi,
                outlinedIcon: FlutterIcons.person_outline_mdi),
          ],
          onItemSelected: (int index) {
            bottonav.pageIndex = index;
          },
        ),
      ),
    );
  }
}
