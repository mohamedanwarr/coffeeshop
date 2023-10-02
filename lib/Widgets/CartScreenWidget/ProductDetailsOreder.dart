// ignore_for_file: non_constant_identifier_names, constant_identifier_names, duplicate_ignore

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Models/ProductsModel.dart';
import '../../constants/Constants.dart';

class ProductDetailsDialog extends StatelessWidget {
  const ProductDetailsDialog(
      {super.key, required this.coffee, required this.quantityMap});

  final Coffee coffee;
  final Map<Coffee, int> quantityMap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final dynamic quantity = quantityMap[coffee] ?? 0;
    List<Coffee> allCoffees = Popularlist + Blackcoffee + Chocolate;

    Coffee getRandomRecommendedCoffee(List<Coffee> allCoffees) {
      final random = Random();
      return allCoffees[random.nextInt(allCoffees.length)];
    }

    Coffee recommendedCoffee = getRandomRecommendedCoffee(allCoffees);
    final double totalpricecoffee = coffee.price * quantity;
    final double Subtotal = totalpricecoffee;
    const double Deliveryfee = 1.95;
    const double Packagingfee = 2.95;
    const double promo = 0;
    final double Total = Subtotal + Deliveryfee + Packagingfee + promo;

    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height * 0.87,
        decoration: ShapeDecoration(
          color: Myconstants.activeColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          ),
        ),
        child: Column(
          children: [
            Divider(
              thickness: 2,
              color: Myconstants.darkColor,
              endIndent: 120,
              indent: 120,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: width,
                  height: 220.75,
                  decoration: BoxDecoration(
                      color: Myconstants.whiteColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              FlutterIcons.location_arrow_faw,
                              color: Colors.amberAccent,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Closest cafe:',
                              style: TextStyle(
                                color: Myconstants.darkColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Co/Choc Tebet (1.5 km)',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                            'Jl. Santuy no. 41, Tebet Barat, Tebet, \nJakarta Selatan',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400)),
                        const SizedBox(
                          height: 5,
                        ),
                        Divider(
                          indent: 8,
                          endIndent: 8,
                          color: Myconstants.darkColor,
                          thickness: 1.5,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Icon(
                              FlutterIcons.location_on_mdi,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Deliver to:',
                              style: TextStyle(
                                color: Myconstants.darkColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'No saved address',
                              style: TextStyle(
                                color: Myconstants.darkColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 200,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                color: Myconstants.darkColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: width,
                height: 440.75,
                decoration: BoxDecoration(
                    color: Myconstants.whiteColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your order:',
                        style: TextStyle(
                          color: Myconstants.darkColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 51,
                              height: 49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                                    onError: (Object, StackTrace) {
                                      LoadingAnimationWidget.discreteCircle(
                                        color: Myconstants.darkColor,
                                        secondRingColor: Myconstants.activeColor,
                                        size: 40,
                                      );
                                    },
                                    image: CachedNetworkImageProvider(
                                        coffee.imageUrl),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text("${quantity}X",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(coffee.name,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400)),
                                        const SizedBox(
                                          width: 90,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Edit',
                                              style: TextStyle(
                                                color: Myconstants.darkColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Text(
                                    '\$${totalpricecoffee.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 200,
                      ),
                      Divider(
                        indent: 8,
                        endIndent: 8,
                        color: Myconstants.darkColor,
                        thickness: 1.5,
                      ),
                      Text(
                        "Other drinks we recommend",
                        style: TextStyle(
                          color: Myconstants.darkColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: 92,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2, // Use recommendedCoffees.length here
                          itemBuilder: (context, int index) {
                            final recommendedCoffee =
                                getRandomRecommendedCoffee(allCoffees);
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                width: 162,
                                height: 92,
                                decoration: ShapeDecoration(
                                  color: Colors.black
                                      .withOpacity(0.20000000298023224),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                                    onError: (Object, StackTrace) {
                                      LoadingAnimationWidget.discreteCircle(
                                        color: Myconstants.darkColor,
                                        secondRingColor:
                                            Myconstants.activeColor,
                                        size: 40,
                                      );
                                    },
                                    image: CachedNetworkImageProvider(
                                        recommendedCoffee.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 40,
                                      left: 10,
                                      child: Text(
                                        recommendedCoffee.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Myconstants.whiteColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 60,
                                      left: 20,
                                      child: Text(
                                        "${recommendedCoffee.price}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Myconstants.whiteColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ordertotal(
                        Subtotal: Subtotal,
                        text: 'Subtotal',
                      ),
                      const ordertotal(
                        Subtotal: Deliveryfee,
                        text: 'Delivery fee',
                      ),
                      const ordertotal(
                        Subtotal: Packagingfee,
                        text: 'Packaging fee',
                      ),
                      const ordertotal(
                        Subtotal: promo,
                        text: 'Promo',
                      ),
                      ordertotal(
                        Subtotal: Total,
                        text: 'Total',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class ordertotal extends StatelessWidget {
  const ordertotal({
    super.key,
    required this.Subtotal,
    required this.text,
  });

  final double Subtotal;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Myconstants.darkColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '\$$Subtotal',
            style: TextStyle(
              color: Myconstants.darkColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
