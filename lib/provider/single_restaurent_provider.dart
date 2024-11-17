import 'package:flutter/cupertino.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';

class FoodItem {
  final String name;
  final String image;
  final String price;
  final String category;

  FoodItem({
    required this.name,
    required this.image,
    required this.price,
    required this.category,
  });
}
class SingleRestaurentProvider extends ChangeNotifier{
  final List<FoodItem> _foodItems = [
    FoodItem(name: "Cookie Sandwich", image: AssetsManager.Item, price: "\$\$", category: "Chinese"),
    FoodItem(name: "Chow Fun", image: AssetsManager.Item1, price: "\$\$", category: "Chinese"),
    FoodItem(name: "Dim Sum", image: AssetsManager.Item, price: "\$\$", category: "Chinese"),
    // Add more items as needed
  ];

  List<FoodItem> get foodItems => _foodItems;

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

  void setHighlightedCategory(String category) {
    _highlightedCategory = category;
    notifyListeners();
  }
}