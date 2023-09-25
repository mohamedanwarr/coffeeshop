// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../Componant/CustomeMenu.dart';
import '../../Models/ProductsModel.dart';

class DetailsCoffee extends StatelessWidget {
  final Coffee coffee;

  const DetailsCoffee({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Stack(children: [
            Positioned(
              top: 0,
              child: Container(
                width: width,
                height: 90,
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
                              'Assets/Icons/clarity_notification-solid-badged.png'),
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
                width: 0,
                height: 280,
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
                      height: 490,
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
                                      onPressed: () {},
                                      icon: Icon(
                                        FlutterIcons.favorite_border_mdi,
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
                                  Container(
                                    width: 100,
                                    height: 44,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF3B2C26),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Color(0xFF3B2C26)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('Assets/Icons/Vector.jpg'),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          '250ml',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFAEAEAE),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 44,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF3B2C26),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Color(0xFF3B2C26)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'Assets/Icons/Vector.jpg',
                                          width: 20,
                                          height: 100,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        const Text(
                                          '350ml',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFAEAEAE),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 44,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF3B2C26),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Color(0xFF3B2C26)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset('Assets/Icons/Vector.jpg'),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        const Text(
                                          '450ml',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFAEAEAE),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        )
                                      ],
                                    ),
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
                              ))
                        ],
                      )),
                ))
          ]),
        ));
  }
}
