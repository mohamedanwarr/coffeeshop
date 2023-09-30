// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeeshop/Providers/CartProviders.dart';
import 'package:coffeeshop/Providers/FavroateProviders.dart';
import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../Componant/CustomeButton.dart';
import '../../Componant/CustomeMenu.dart';
import '../../Models/ProductsModel.dart';
import '../../Utilies/snackbar.dart';

class DetailsCoffee extends StatelessWidget {
  final Coffee coffee;

  const DetailsCoffee({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void addtocart(){
      final getcart=Provider.of<cartprovider>(context,listen: false);
      if(getcart.counter>0){
        getcart.addToCart(coffee,getcart.counter);
        SnacBar.showmessage('Successfully added to cart', isuccess: true);
      }else{
        SnacBar.showmessage('Nothing added to cart', isuccess: false);
      }
    }
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final getfavor = Provider.of<favor>(context);
    final getcart=Provider.of<cartprovider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Stack(children: [
            Positioned(
              top: 0,
              child: Container(
                width: width,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Myconstants.activeColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: Stack(
                  children: [
                    Positioned(
                        left: 20,
                        top: 40,
                        child: Icon(
                          FlutterIcons.search_mdi,
                          color: Myconstants.darkColor,
                          size: 30,
                        )),
                    Positioned(
                        left: 55,
                        top: 40,
                        child: Text(
                          'Good day, ',
                          style: TextStyle(
                              fontSize: 18,
                              color: Myconstants.darkColor,
                              fontWeight: FontWeight.w400),
                        )),
                    const Positioned(right: 20, top: 35, child: PopMenu()),
                    Positioned(
                        right: 75,
                        top: 35,
                        child: SizedBox(
                          width: 25,
                          height: 34,
                          child: Image.asset(
                              'Assets/Icons/Notifications icon.png',
                            color: Myconstants.darkColor,
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              top: 90,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.34,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
                      onError: (Object, StackTrace) {
                        LoadingAnimationWidget.discreteCircle(
                          color: Myconstants.darkColor,
                          secondRingColor: Myconstants.activeColor,
                          size: 40,
                        );
                      },
                      image: CachedNetworkImageProvider(coffee.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              top: 285,
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 133,
                                    height: 47,
                                    decoration: ShapeDecoration(
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          style: BorderStyle.solid,
                                            width: 2,
                                            color: Myconstants.activeColor),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              getcart.decquantity();

                                            },
                                            icon: Icon(
                                              FlutterIcons.minus_ant,
                                              color: Myconstants.activeColor,
                                            )),
                                        Text(
                                          '${getcart.counter}',
                                          style: TextStyle(
                                            color: Myconstants.activeColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              getcart.incquantity();
                                            },
                                            icon: Icon(
                                              FlutterIcons.plus_ant,
                                              color: Myconstants.activeColor,
                                            ))
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      addtocart();
                                    },
                                    child: CustomeButton(
                                      width: 190,
                                      height: 50,
                                      textbutton: 'ADD TO CART',
                                      colorButton: Myconstants.activeColor,
                                      colortextButton: Myconstants.darkColor,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      )),
                ))
          ]),
        ));
  }
}

class SizeCoffee extends StatelessWidget {
  const SizeCoffee({
    super.key,
    required this.size,
    this.sizecup,
    this.color,
    this.backgroundColor,
    this.onTap,
  });

  final String size;
  final double? sizecup;
  final Color? color;
  final dynamic backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 44,
        decoration: ShapeDecoration(
          color: const Color(0xFF3B2C26),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: backgroundColor),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FlutterIcons.coffee_outline_mco, size: sizecup, color: color),
            const SizedBox(
              width: 5,
            ),
            Text(
              size,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
