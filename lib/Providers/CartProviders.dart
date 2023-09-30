import 'package:flutter/cupertino.dart';

import '../Models/ProductsModel.dart';

class cartprovider extends ChangeNotifier {
  final List<Coffee> _cart = [];
  List<Coffee> get cart => _cart;
  int counter=0;


  void incquantity(){
    counter++;
    notifyListeners();
  }
  void decquantity(){
    if(counter>0){
      counter--;
    }else{
      return null;
    }
    notifyListeners();
  }


  void addToCart(Coffee coffeeitem , int quantity) {
    for (int i =0; i<quantity; i++) {
      _cart.add(coffeeitem);
    }
    notifyListeners();
  }
  void removeFromCart(Coffee coffeeitem) {
    _cart.remove(coffeeitem);
    notifyListeners();
  }
}
