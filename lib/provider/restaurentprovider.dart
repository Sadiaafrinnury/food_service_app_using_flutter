import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';
import 'package:provider/provider.dart'; // Make sure to include provider if you haven't already


class Restaurant {
  final List<String> imageUrl; // Change to List<String> to accommodate multiple images
  final String name;
  final String cuisines;
  final String rating;
  final String deliveryTime;
  final String deliveryFee;
  final String ratingsCount;

  Restaurant({
    required this.imageUrl,
    required this.name,
    required this.cuisines,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.ratingsCount,
  });
}

class RestaurantProvider extends ChangeNotifier {
  final List<Restaurant> restaurants = [
    Restaurant(
      imageUrl: [
        'assets/images/BG6.png',
        'assets/images/BG5.png',
        'assets/images/BG4.png',
      ],
      name: "McDonald's",
      cuisines: "\$\$ • Chinese • American • Deshi food",
      rating: "4.3",
      deliveryTime: "25 Min",
      deliveryFee: "Free",
      ratingsCount: "200+ Ratings",
    ),
    Restaurant(
      imageUrl: [
        'assets/images/BG4.png',
        'assets/images/BG5.png',
      ],
      name: "Cafe Brichor’s",
      cuisines: "\$\$ • Burgers • Fast Food",
      rating: "4.0",
      deliveryTime: "20 Min",
      deliveryFee: "Free",
      ratingsCount: "150+ Ratings",
    ),
    Restaurant(
      imageUrl: [
        'assets/images/BG5.png',
        'assets/images/BG4.png',
      ],
      name: "Pizza Hut",
      cuisines: "\$\$ • Italian • Pizza",
      rating: "4.5",
      deliveryTime: "30 Min",
      deliveryFee: "\$2.00",
      ratingsCount: "300+ Ratings",
    ),
  ];
}


