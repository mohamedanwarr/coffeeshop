import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../Componant/CustomeMenu.dart';
import '../../constants/Constants.dart';
class defualtappbar extends StatelessWidget {
  const defualtappbar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Myconstants.activeColor,
        width: width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Stack(
          children: [
            Positioned(
              left: 15,
              top: 38,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  FlutterIcons.arrow_back_mdi,
                  size:30,
                  color: Myconstants.darkColor,
                ),
              ),
            ),
            Positioned(
                left: 60,
                top: 40,
                child: Text(
                  'Good day, ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Myconstants.darkColor,
                      fontWeight: FontWeight.w400),
                )),
            Positioned(
                right: 75,
                top: 35,
                child: SizedBox(
                    width: 30,
                    height: 34,
                    child: Icon(
                      FlutterIcons.ios_notifications_outline_ion,
                      color: Myconstants.darkColor,
                      size: 30,
                    ))),
            const Positioned(right: 20, top: 35, child: PopMenu()),

          ],
        )

    );
  }
}