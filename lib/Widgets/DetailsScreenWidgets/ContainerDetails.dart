import 'package:coffeeshop/Widgets/DetailsScreenWidgets/quantityConatiner.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../Models/ProductsModel.dart';
import '../../Providers/CartProviders.dart';
import '../../Providers/FavroateProviders.dart';
import '../../constants/Constants.dart';
import 'SizeBox.dart';

class ContainerDetails extends StatelessWidget {
  const ContainerDetails({
    super.key,
    required this.width,
    required this.coffee,
    required this.getfavor,
    required this.height,
    required this.getcart,
  });

  final double width;
  final Coffee coffee;
  final favor getfavor;
  final double height;
  final cartprovider getcart;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: MediaQuery.of(context).size.height * 0.60,
        decoration: BoxDecoration(
            color: Myconstants.darkColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            shape: BoxShape.rectangle),
        child: Stack(
          children: [
            //Type product
            Positioned(
              left: 20,
              top: 20,
              child: Text(
                coffee.type,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Myconstants.activeColor,
                ),
              ),
            ),
            //fav and share
            Positioned(
                right: 20,
                top: 20,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          getfavor.toggleFavorite(coffee);
                        },
                        icon: Icon(
                          getfavor.isFavorite(coffee)
                              ? FlutterIcons.favorite_mdi
                              : FlutterIcons.favorite_border_mdi,
                          size: 30,
                          color: Myconstants.activeColor,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FlutterIcons.share_2_fea,
                          size: 30,
                          color: Myconstants.activeColor,
                        )),
                  ],
                )),
            // NameProduct
            Positioned(
              top: 70,
              left: 30,
              child: Text(
                coffee.name,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Myconstants.activeColor,
                ),
              ),
            ),
            //Description
            Positioned(
              top: 105,
              left: 20,
              right: 10,
              child: SizedBox(
                width: width,
                height: height,
                child: Text(
                  coffee.description,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Myconstants.activeColor,
                      height: 1),
                ),
              ),
            ),
            //Rating
            Positioned(
                top: 160,
                left: 20,
                child: Row(
                  children: [
                    const Icon(
                      FlutterIcons.star_ent,
                      color: Color(0xFFF2994A),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${coffee.rating}",
                      style: const TextStyle(
                        color: Color(0xFFF2994A),
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '(10k)',
                      style: TextStyle(
                        color: Color(0xFFE0DBDB),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.75,
                      ),
                    )
                  ],
                )),
            Positioned(
              top: 210,
              left: 20,
              child: Text(
                'Size',
                style: TextStyle(
                  color: Myconstants.activeColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 0.10,
                ),
              ),
            ),
            //choose Size
            Positioned(
                top: 230,
                left: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizeCoffee(
                      onTap: () {
                        return getfavor.toggleSelection(0);
                      },
                      size: '250ml',
                      color: getfavor.selectedIndex == 0
                          ? Myconstants.activeColor
                          : const Color(0xFFAEAEAE),
                      sizecup: 20,
                      backgroundColor: getfavor.selectedIndex == 0
                          ? Myconstants.activeColor
                          : Myconstants.darkColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizeCoffee(
                      onTap: () {
                        return getfavor.toggleSelection(1);
                      },
                      size: '350ml',
                      color: getfavor.selectedIndex == 1
                          ? Myconstants.activeColor
                          : const Color(0xFFAEAEAE),
                      sizecup: 25,
                      backgroundColor: getfavor.selectedIndex == 1
                          ? Myconstants.activeColor
                          : Myconstants.darkColor,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizeCoffee(
                      onTap: () {
                        return getfavor.toggleSelection(2);
                      },
                      size: '450ml',
                      color: getfavor.selectedIndex == 2
                          ? Myconstants.activeColor
                          : const Color(0xFFAEAEAE),
                      sizecup: 30,
                      backgroundColor: getfavor.selectedIndex == 2
                          ? Myconstants.activeColor
                          : Myconstants.darkColor,
                    ),
                  ],
                )),
            //Price
            Positioned(
                top: 300,
                left: 20,
                child: Text(
                  "£${coffee.price}",
                  style: TextStyle(
                    color: Myconstants.activeColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  ),
                )),
            Positioned(
                bottom: 35,
                left: 20,
                right: 20,
                child: quantitiyContainer(
                  getcart: getcart,
                  coffee: coffee,
                ))
          ],
        ));
  }
}
