import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../Componant/CustomeMenu.dart';
import '../../constants/Constants.dart';
// ignore: camel_case_types
class appbarfave extends StatelessWidget {
  const appbarfave({
    super.key,
  });

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
                'Favorites ',
                style: TextStyle(
                    fontSize: 18,
                    color: Myconstants.darkColor,
                    fontWeight: FontWeight.w600),
              )),
          const Positioned(
              left: 30,
              top: 130,
              child: Text(
                'Your favorite drinks to lighten up your day ',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF834D1E),
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
