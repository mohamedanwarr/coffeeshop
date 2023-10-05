import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../Models/ProductsModel.dart';
import '../../Providers/FavroateProviders.dart';
import '../../Widgets/FavoraiteWidgets/appbarfavo.dart';
import '../../constants/Constants.dart';

class FavoraiteScreen extends StatelessWidget {
  const FavoraiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final favoriteCoffeeModel = Provider.of<favor>(context);
    final favoriteCoffeeIds = favoriteCoffeeModel.favoriteCoffeeIds;

    final Set<String> uniqueFavoriteCoffeeIds = Set<String>();
    final List<Coffee> favoriteCoffees = [];

    // Loop through all categories to collect favorite coffees
    for (List<Coffee> categoryCoffees in [Popularlist, Blackcoffee, Winterspecial, Decaffcoffee, Chocolate]) {
      for (Coffee coffee in categoryCoffees) {
        if (favoriteCoffeeIds.contains(coffee.id) && !uniqueFavoriteCoffeeIds.contains(coffee.id)) {
          uniqueFavoriteCoffeeIds.add(coffee.id);
          favoriteCoffees.add(coffee);
        }
      }
    }
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Myconstants.darkColor,
      body: Stack(
        children: [
          const appbarfave(),
          Padding(
              padding: EdgeInsets.only(
                  top: height * 0.190),
              child: SafeArea(
                child: Container(
                    width: width,
                    height: height * 0.75,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: favoriteCoffees.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 8),
                            child: Slidable(
                              endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        favoriteCoffeeModel.toggleFavorite(
                                            favoriteCoffees.removeAt(index));
                                      },
                                      label: 'Delete',
                                      autoClose: true,
                                      borderRadius: BorderRadius.circular(20),
                                      backgroundColor: Myconstants.activeColor,
                                      foregroundColor: Myconstants.darkColor,
                                      icon: FlutterIcons.delete_ant,
                                    )
                                  ]),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.130,
                                decoration: ShapeDecoration(
                                  color: Myconstants.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 20,
                                      top: 20,
                                      child: Text(
                                        favoriteCoffees[index].type,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Myconstants.darkColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 20,
                                      top: 40,
                                      child: Text(
                                        favoriteCoffees[index].name,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Myconstants.darkColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      top: 5,
                                      child: Container(
                                        width: 70,
                                        height: 93,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                              // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                                              onError: (Object, StackTrace) {
                                                LoadingAnimationWidget
                                                    .discreteCircle(
                                                  color: Myconstants.darkColor,
                                                  secondRingColor:
                                                      Myconstants.activeColor,
                                                  size: 40,
                                                );
                                              },
                                              image: CachedNetworkImageProvider(
                                                  favoriteCoffees[index]
                                                      .imageUrl),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })),
              ))
        ],
      ),
    );
  }
}
