import 'package:flutter/material.dart';

class TypeLocationProvider with ChangeNotifier {
  List<String> _suggestions = [];
  String? _selectedAddress;

  List<String> get suggestions => _suggestions;

  String? get selectedAddress => _selectedAddress; // Public getter for the selected address

  void fetchSuggestions(String query) {
    // Implement your logic to fetch suggestions based on the query
    _suggestions = [
      "Dhaka",
      "Dhanmondi",
      "Gulshan",
      "Banani",
    ].where((address) => address.toLowerCase().contains(query.toLowerCase())).toList();

    notifyListeners(); // Notify listeners to rebuild
  }

  void selectAddress(String address) {
    _selectedAddress = address;
    notifyListeners(); // Notify listeners to rebuild
  }
}

