// ignore_for_file: file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../Utilies/ListMenuButton.dart';
import '../constants/Constants.dart';
class PopMenu extends StatelessWidget {
  const PopMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Icon(
          FlutterIcons.list_ent,
          size: 35,
          color: Myconstants.darkColor,
        ),
        items: List.generate(MenuButtons.items.length * 2 - 1, (index) {
          if (index.isOdd) {
            // Return a divider for odd indices
            return const DropdownMenuItem<Divider>(
                enabled: false,
                child: Divider(
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
                  const SizedBox(width: 30),
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
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
            color: Myconstants.whiteColor,
          ),
          offset: const Offset(0, 8),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 20,
          customHeights:
          List.generate(MenuButtons.items.length * 2 - 1, (index) {
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