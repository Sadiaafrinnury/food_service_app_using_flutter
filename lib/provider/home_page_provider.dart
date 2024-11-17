import 'package:flutter/material.dart';


class Partner {
  final String image;
  final String name;
  final String location;
  final String cuisine;
  final String deliveryTime;
  final String rating;
  final String deliverytext;

  Partner({
    required this.image,
    required this.name,
    required this.location,
    required this.cuisine,
    required this.deliveryTime,
    required this.rating,
    required this.deliverytext
  });
}

class HomePageProvider extends ChangeNotifier {
  double _maxPrice = 100.0;
  double _minRating = 0.0;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isGlutenFree = false;

  // Getters for filter values
  double get maxPrice => _maxPrice;
  double get minRating => _minRating;
  bool get isVegan => _isVegan;
  bool get isVegetarian => _isVegetarian;
  bool get isGlutenFree => _isGlutenFree;

  // Setters for filter values
  void setMaxPrice(double value) {
    _maxPrice = value;
    notifyListeners();
  }

  void setMinRating(double value) {
    _minRating = value;
    notifyListeners();
  }

  void setDietaryPreference(String preference, bool value) {
    switch (preference) {
      case 'Vegan':
        _isVegan = value;
        break;
      case 'Vegetarian':
        _isVegetarian = value;
        break;
      case 'Gluten-Free':
        _isGlutenFree = value;
        break;
    }
    notifyListeners();
  }

  // Function to open filter dialog
  void openFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        // Create temporary variables to hold current values
        double tempMaxPrice = _maxPrice;
        double tempMinRating = _minRating;
        bool tempIsVegan = _isVegan;
        bool tempIsVegetarian = _isVegetarian;
        bool tempIsGlutenFree = _isGlutenFree;

        return AlertDialog(
          title: const Text("Filter Options"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Maximum Price Slider
                const Text("Maximum Price"),
                Slider(
                  value: tempMaxPrice,
                  min: 0.0,
                  max: 200.0,
                  divisions: 20,
                  label: '\$${tempMaxPrice.toStringAsFixed(0)}',
                  onChanged: (value) {
                    tempMaxPrice = value; // Update temporary value
                    setMaxPrice(value); // Immediately update provider
                  },
                ),

                // Minimum Rating Slider
                const Text("Minimum Rating"),
                Slider(
                  value: tempMinRating,
                  min: 0.0,
                  max: 5.0,
                  divisions: 5,
                  label: tempMinRating.toStringAsFixed(1),
                  onChanged: (value) {
                    tempMinRating = value; // Update temporary value
                    setMinRating(value); // Immediately update provider
                  },
                ),

                // Dietary Preferences Checkboxes
                const Text("Dietary Preferences"),
                CheckboxListTile(
                  title: const Text("Vegan"),
                  value: tempIsVegan,
                  onChanged: (value) {
                    tempIsVegan = value!; // Update temporary value
                    setDietaryPreference(
                        'Vegan', value); // Immediately update provider
                  },
                ),
                CheckboxListTile(
                  title: const Text("Vegetarian"),
                  value: tempIsVegetarian,
                  onChanged: (value) {
                    tempIsVegetarian = value!; // Update temporary value
                    setDietaryPreference(
                        'Vegetarian', value); // Immediately update provider
                  },
                ),
                CheckboxListTile(
                  title: const Text("Gluten-Free"),
                  value: tempIsGlutenFree,
                  onChanged: (value) {
                    tempIsGlutenFree = value!; // Update temporary value
                    setDietaryPreference(
                        'Gluten-Free', value); // Immediately update provider
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: const Text("Close"),
            ),
            TextButton(
              onPressed: () {
                // Update the provider with the final selections (optional)
                setMaxPrice(tempMaxPrice);
                setMinRating(tempMinRating);
                setDietaryPreference('Vegan', tempIsVegan);
                setDietaryPreference('Vegetarian', tempIsVegetarian);
                setDietaryPreference('Gluten-Free', tempIsGlutenFree);

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text("Apply"),
            ),
          ],
        );
      },
    );
  }


  List<Partner> _partners = [
    Partner(
      image: 'assets/images/BG1.png',
      name: 'Krispy Creme',
      location: 'St George Terrace, Perth',
      cuisine: 'American • Cafe',
      deliveryTime: '25min',
      rating: '4.5',
      deliverytext: 'Free delivery',
    ),

    Partner(
      image: 'assets/images/BG.png',
      name: 'Mario Italiano',
      location: 'Hay Street, Perth City',
      cuisine: 'Italian',
      deliveryTime: '30min',
      rating: '4.3',
      deliverytext: 'Free delivery',
    ),

  ];

  List<Partner> get partners => _partners;

}

