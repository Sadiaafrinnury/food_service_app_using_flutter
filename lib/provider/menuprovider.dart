import 'package:flutter/material.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';

class FoodItem {
  final String name;
  final String image;
  final String price;
  final String category;
  final String description;

  FoodItem({
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.description
  });
}


class SeafoodItem {
  final String name;
  final String image;
  final String price;
  final String category;
  final String description;

  SeafoodItem({
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.description
  });
}

class FoodProvider with ChangeNotifier {
  // List of food items
  final List<FoodItem> _foodItems = [
    FoodItem(
        name: "Cookie Sandwich",
        image: AssetsManager.Food,
        price: "AUD\$10",
        category: "\$\$ . Chinese",
        description: 'Shortbread,\nchocolate turtle\ncookies,\nand red velvet.'
    ),
    FoodItem(
        name: "Chow Fun",
        image: AssetsManager.Food1,
        price: "AUD\$12",
        category: "\$\$ . Chinese",
        description: 'Shortbread,\nchocolate turtle\ncookies,\nand red velvet.'
    ),
    FoodItem(
        name: "Dim Sum",
        image: AssetsManager.Food2,
        price: "AUD\$15",
        category: "\$\$ . Chinese",
        description: 'Shortbread,\nchocolate turtle\ncookies,\nand red velvet.'
    ),

  ];

  List<FoodItem> get foodItems => _foodItems;

  // List of seafood items
  final List<SeafoodItem> _seafoodItems = [
    SeafoodItem(
        name: "Oyster Dish",
        image: AssetsManager.Seafood,
        price: "AUD\$10",
        category: "\$\$ . Chinese",
        description: 'Shortbread,\nchocolate turtle\ncookies,\nand red velvet.'
    ),
    SeafoodItem(
        name: "Oyster On Ice",
        image: AssetsManager.Seafood1,
        price: "AUD\$12",
        category: "\$\$ . Chinese",
        description: 'Shortbread,\nchocolate turtle\ncookies,\nand red velvet.'
    ),
    SeafoodItem(
        name: "Fried Rice on Pot",
        image: AssetsManager.Seafood2,
        price: "AUD\$15",
        category: "\$\$ . Chinese",
        description: 'Shortbread,\nchocolate turtle\ncookies,\nand red velvet.'
    ),

  ];

  List<SeafoodItem> get seafoodItems => _seafoodItems;

  // List of categories
  List<String> _categories = [
    "Chicken",
    "Beef",
    "Pork",
    "Lamb",
    "Seafood",
    "Appetizers",
    "Desserts",
  ];

  String _highlightedCategory = "Seafood";

  List<String> get categories => _categories;

  String get highlightedCategory => _highlightedCategory;

  // Method to update highlighted category
  void setHighlightedCategory(String category) {
    _highlightedCategory = category;
    notifyListeners();
  }
}
