import 'package:flutter/material.dart';
import '../views/type_location_screen.dart';


class LocationProvider extends ChangeNotifier {
  String? address;
  List<String> suggestions = [];

  // Method to simulate using the current location
  void useCurrentLocation() {
    // Add logic for using current location
    address = "Your Current Location";
    notifyListeners();
  }

  // Method to fetch suggestions (simulated)
  void fetchSuggestions(String query) {
    suggestions = [
      "St Georges Terrace, Perth",
      "Murray Street, Perth",
      "Kings Square, Perth"
    ];
    notifyListeners();
  }

  // Method to select an address
  void selectAddress(String selectedAddress) {
    address = selectedAddress;
    notifyListeners();
  }

  // Method to navigate to TypeLocationScreen
  void goToTypeLocationScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TypeLocationScreen(),
      ),
    );
  }
}

