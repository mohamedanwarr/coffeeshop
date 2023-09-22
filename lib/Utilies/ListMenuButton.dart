// ignore_for_file: constant_identifier_names



import 'package:coffeeshop/Providers/MainScreenProviders.dart';
import 'package:coffeeshop/Utilies/snackbar.dart';
import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:provider/provider.dart';

import '../Providers/LoginandSignuproviders.dart';
import '../Screens/LoginandSignup/Authcinyicate.dart';

class MenuButton {
  final String text;
  final IconData icon;

  const MenuButton({
    required this.text,
    required this.icon,
  });
}

abstract class MenuButtons {
  static List<MenuButton> items = [Profile, Settings, Help, Logout];
  static const MenuButton Profile =
      MenuButton(text: 'Profile', icon: FlutterIcons.person_outline_mdi);
  static const MenuButton Settings =
      MenuButton(text: 'Settings', icon: FlutterIcons.setting_ant);
  static const MenuButton Help =
      MenuButton(text: 'Help', icon: FlutterIcons.help_ent);
  static const MenuButton Logout =
      MenuButton(text: 'Logout', icon: FlutterIcons.log_out_ent);
  static BuildContext? navigationContext;
  static Widget buildItem(BuildContext context,MenuButton item) {
    return GestureDetector(
      onTap: (){
        onChanged(context, item);
      },
      child: Row(
        children: [
          Icon(item.icon, color: Myconstants.darkColor, size: 22),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              item.text,
              style: TextStyle(
                color: Myconstants.darkColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void onChanged(BuildContext context, MenuButton item) {
    switch (item) {
      case MenuButtons.Profile:
        //Do something
        break;
      case MenuButtons.Settings:
        //Do something
        break;
      case MenuButtons.Help:
        //Do something
        break;
      case MenuButtons.Logout:
      _handleLogout(context);
        //Do something
        break;
    }
  }
  static void _handleLogout(BuildContext context) async {
     final logout = Provider.of<LoginandSignup>(context,listen: false);

    try {
      await logout.signOut().then((value) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (navigationContext) => const loginandsignup(), // Replace with your authentication screen
          ),
        );
      });
    } catch (e) {
      SnacBar.showmessage("Error during logout ", isuccess: false);

    }
  }
}
