import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../Componant/CustomeButton.dart';
import '../../Models/ProductsModel.dart';
import '../../Providers/CartProviders.dart';
import '../../Utilies/snackbar.dart';
import '../../constants/Constants.dart';

class quantitiyContainer extends StatelessWidget {
  const quantitiyContainer({
    super.key,
    required this.getcart,
    required this.coffee,
  });

  final cartprovider getcart;
  final Coffee coffee;

  @override
  Widget build(BuildContext context) {
    void addtocart() {
      final getcart = Provider.of<cartprovider>(context, listen: false);
      if (getcart.counter > 0) {
        getcart.addToCart(coffee, getcart.counter);
        SnacBar.showmessage('Successfully added to cart', isuccess: true);
      } else {
        SnacBar.showmessage('Nothing added to cart', isuccess: false);
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          onTap: () {
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
    );
  }
}
