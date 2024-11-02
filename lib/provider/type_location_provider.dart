import 'package:flutter/material.dart';

class TypeLocationProvider with ChangeNotifier {
  String? _address;
  List<String> _suggestions = [];
  String locationQuery = "";

  String? get address => _address;
  List<String> get suggestions => _suggestions;

  // Mock method to simulate fetching location suggestions from API
  Future<void> fetchSuggestions(String query) async {
    // Replace this mock list with your API call for real location suggestions
    _suggestions = [
      "HayStreet, Perth",
      "St Georges Terrace, Perth",
      "Murray Street, Perth",
      "Kings Square, Perth",
    ].where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
  }

  void selectAddress(String address) {
    _address = address;
    _suggestions = []; // Clear suggestions once an address is selected
    notifyListeners();
  }


  void updateLocationQuery(String query) {
    locationQuery = query;
    notifyListeners();
  }
}