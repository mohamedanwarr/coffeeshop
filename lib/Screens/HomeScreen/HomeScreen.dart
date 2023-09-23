// ignore_for_file: file_names

import 'package:coffeeshop/constants/Constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../Utilies/ListMenuButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 5, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Myconstants.darkColor,
      body: AppBarandTab(tabController: _tabController),
    );
  }
}

class AppBarandTab extends StatelessWidget {
  const AppBarandTab({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 220,
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
              top: MediaQuery.of(context).size.height * 0.265),
          child: Container(
            padding: const EdgeInsets.only(
              left: 12,
            ),
            child: TabBarView(controller: _tabController, children: [
             Center(child: Text('Popular',style: TextStyle(
               color: Myconstants.activeColor
             ),)),
             Center(child: Text('Black coffee',style: TextStyle(
                 color: Myconstants.activeColor
             ),)),
             Center(child: Text('Winter special',style: TextStyle(
                 color: Myconstants.activeColor
             ),)),
             Center(child: Text('DECAFF',style: TextStyle(
                 color: Myconstants.activeColor
             ),)),
             Center(child: Text('CHOCOLATE',style: TextStyle(
                 color: Myconstants.activeColor
             ),))
            ]),
          ),
        )

      ],
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
        customButton: Icon(
          MaterialIcons.menu,
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
