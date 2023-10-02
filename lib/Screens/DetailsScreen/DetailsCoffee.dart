// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffeeshop/Providers/CartProviders.dart';
import 'package:coffeeshop/Providers/FavroateProviders.dart';
import 'package:coffeeshop/constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../Models/ProductsModel.dart';
import '../../Widgets/DetailsScreenWidgets/ContainerDetails.dart';
import '../../Widgets/DetailsScreenWidgets/Defualtappbar.dart';

class DetailsCoffee extends StatelessWidget {
  final Coffee coffee;

  const DetailsCoffee({Key? key, required this.coffee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final getfavor = Provider.of<favor>(context);
    final getcart = Provider.of<cartprovider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Stack(children: [
            Positioned(
                top: 0,
                child: defualtappbar(width: width)),
            Positioned(
              right: 0,
              left: 0,
              top: 80,
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
                  child: ContainerDetails(width: width, coffee: coffee, getfavor: getfavor, height: height, getcart: getcart),
                ))
          ]),
        ));
  }
}






