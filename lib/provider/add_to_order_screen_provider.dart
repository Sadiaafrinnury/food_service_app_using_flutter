import 'package:flutter/cupertino.dart';

class OrderProvider extends ChangeNotifier {
    String? selectedTopCookie;
    String? selectedBottomCookie;
    String? specialInstructions;
    int quantity = 1;
    double price = 11.98;

    void selectTopCookie(String cookie) {
      selectedTopCookie = cookie;
      notifyListeners();
    }

    void selectBottomCookie(String cookie) {
      selectedBottomCookie = cookie;
      notifyListeners();
    }

    void updateSpecialInstructions(String instructions) {
      specialInstructions = instructions;
      notifyListeners();
    }

    void updateQuantity(int change) {
      if (quantity + change > 0) {
        quantity += change;
        notifyListeners();
      }
    }

    double get totalPrice => price * quantity;
}