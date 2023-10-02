import 'package:flutter/material.dart';

import '../Models/ProductsModel.dart';
class favor extends ChangeNotifier{
  List<String> _favoriteCoffeeIds = [];

  List<String> get favoriteCoffeeIds => _favoriteCoffeeIds;
  int selectedIndex = -1;

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
  List<Coffee> getFavoriteCoffees(List<Coffee> allCoffees) {
    return allCoffees.where((coffee) => _favoriteCoffeeIds.contains(coffee.id)).toList();
  }


}