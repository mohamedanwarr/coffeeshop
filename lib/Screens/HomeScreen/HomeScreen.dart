import 'package:coffeeshop/constants/Constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../Utilies/ListMenuButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myconstants.darkColor,

      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                width:double.infinity,
                height: 210,
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
                        left: 30,
                        top: 80,
                        child: Text(
                          'What would you like \nto drink today? ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Myconstants.darkColor,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                ),

              ))
        ],
      ),
    );
  }
}

class PopMenu extends StatelessWidget {
  const PopMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
      customButton:  Icon(FlutterIcons.menu_ent,
      size: 35,
      color: Myconstants.darkColor,
      ),
        items: List.generate(MenuButtons.items.length * 2 - 1, (index) {
          if (index.isOdd) {
            // Return a divider for odd indices
            return DropdownMenuItem<Divider>(enabled: false, child: Divider(
              endIndent: 0,
              indent: 0,

            ));
          } else {
            // Return a custom widget for even indices (actual items)
            final itemIndex = index ~/ 2;
            final item = MenuButtons.items[itemIndex];
            return DropdownMenuItem<MenuButton>(
              value: item,
              child: Row(
                children: [
                  Icon(item.icon),
                  SizedBox(width: 30),
                  Text(item.text)
                ],
              ), // Replace with your item widget
            );
          }
        }),
        onChanged: (value) {
          MenuButtons.onChanged(context, value! as MenuButton);
        },
        dropdownStyleData: DropdownStyleData(
          width: 190,
          padding: const EdgeInsets.symmetric(vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft:Radius.circular(30) ),
            color: Myconstants.whiteColor,
          ),
          offset: const Offset(0, 8),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 20,
          customHeights: List.generate(MenuButtons.items.length * 2 - 1, (index) {
            if (index.isOdd) {
              return 4; // Height of the divider
            } else {
              return 48; // Height of the item
            }
          }),
          padding: const EdgeInsets.only(left: 25, right: 16),
        ),

      ),

    );
  }
}
