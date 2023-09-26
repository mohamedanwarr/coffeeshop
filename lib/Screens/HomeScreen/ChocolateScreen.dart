import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';

import '../../Models/ProductsModel.dart';
import '../../constants/Constants.dart';
import '../DetailsScreen/DetailsCoffee.dart';

class ChocolateCoffee extends StatelessWidget {
  const ChocolateCoffee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.63,
          width: width,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: Chocolate.length,
              itemBuilder: (context, index) {
                final coffee = Chocolate[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            child: DetailsCoffee(
                              coffee: coffee,
                            ),
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 200),
                          ));
                    },
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.131,
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
                              coffee.type,
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
                              coffee.name,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
