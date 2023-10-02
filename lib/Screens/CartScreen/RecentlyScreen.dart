import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../Componant/CustomeButton.dart';
import '../../Models/ProductsModel.dart';
import '../../Providers/CartProviders.dart';
import '../../Widgets/CartScreenWidget/ProductDetailsOreder.dart';
import '../../constants/Constants.dart';

class RecentlyScreen extends StatelessWidget {
  const RecentlyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<cartprovider>(context);
    final cartItems = cartProvider.cart;
    final quantityMap = <Coffee, int>{};
    for (final cartItem in cartItems) {
      quantityMap.putIfAbsent(cartItem, () => 0);
      quantityMap[cartItem] = quantityMap[cartItem]! + 1;
    }
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.63,
          width: width,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: quantityMap.length,
              itemBuilder: (context, index) {
                final coffeeItem = quantityMap.keys.elementAt(index);
                final quantity = quantityMap[coffeeItem];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Slidable(
                    endActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          cartProvider.removeFromCart(coffeeItem);
                        },
                        label: 'Delete',
                        autoClose: true,
                        borderRadius: BorderRadius.circular(20),
                        backgroundColor: Myconstants.activeColor,
                        foregroundColor: Myconstants.darkColor,
                        icon: FlutterIcons.delete_ant,
                      )
                    ]),
                    child: GestureDetector(
                      onTap: () {
                        
                        showMaterialModalBottomSheet(

                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => ProductDetailsDialog(
                            coffee: coffeeItem,
                            quantityMap: quantityMap,
                          ),
                        );
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
                                coffeeItem.type,
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
                                coffeeItem.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Myconstants.darkColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 70,
                              child: Text(
                                "${quantity}x",
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
                                          secondRingColor:
                                              Myconstants.activeColor,
                                          size: 40,
                                        );
                                      },
                                      image: CachedNetworkImageProvider(
                                          coffeeItem.imageUrl),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),

      ],
    );
  }
}
