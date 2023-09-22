// ignore_for_file: constant_identifier_names

import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:icons_flutter/icons_flutter.dart';

class MenuButton{
 final String text;
 final IconData icon;


const MenuButton({required this.text, required this.icon,});
}
abstract class MenuButtons{
 static  List<MenuButton> items= [Profile,Settings,Help,Logout];
 static const  MenuButton Profile=MenuButton( text: 'Profile', icon: FlutterIcons.person_outline_mdi);
 static const  MenuButton Settings=MenuButton( text: 'Settings', icon: FlutterIcons.setting_ant);
 static const  MenuButton Help=MenuButton( text: 'Help', icon: FlutterIcons.help_ent);
 static const  MenuButton Logout=MenuButton( text: 'Logout', icon: FlutterIcons.log_out_ent);

 static Widget buildItem( MenuButton item ) {
  return Row(
   children: [
    Icon(item.icon, color: Myconstants.darkColor, size: 22),
    const SizedBox(
     width: 10,
    ),
    Expanded(
     child: Text(
      item.text,
      style:  TextStyle(
       color:Myconstants.darkColor,
      ),
     ),
    ),
   ],
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
   //Do something
    break;
  }
 }
}