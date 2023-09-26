import 'package:flutter/material.dart';

import '../Models/ProductsModel.dart';
class favor extends ChangeNotifier{
  List<String> _favoriteCoffeeIds = [];

  List<String> get favoriteCoffeeIds => _favoriteCoffeeIds;
  int selectedIndex = -1;
  int counter=1;

  void toggleSelection(int index) {
    if (index == selectedIndex) {
      // If the same item is tapped again, deselect it
      selectedIndex = -1;
    } else {
      // Otherwise, select the new item
      selectedIndex = index;
    }
    notifyListeners();
  }
  void inc(){
    counter++==1;
    notifyListeners();
  }
  void dec(){
    if(counter>=2){
      counter--;
    }else{
      return null;
    }
    notifyListeners();
  }


  bool isFavorite(Coffee coffee) {
    return _favoriteCoffeeIds.contains(coffee.id);
  }

  void toggleFavorite(Coffee coffee) {
    if (isFavorite(coffee)) {
      _favoriteCoffeeIds.remove(coffee.id);
    } else {
      _favoriteCoffeeIds.add(coffee.id);
    }
    coffee.isFavorite = isFavorite(coffee);
    notifyListeners();
  }


}