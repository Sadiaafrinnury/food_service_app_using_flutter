import 'package:flutter/material.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';


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

class BestPickRestaurentbyteamProvider extends ChangeNotifier {
  List<Partner> _partners = [
    Partner(
      image: AssetsManager.BG2,
      name: 'McDonald’s',
      location: 'Hay street , Perth City',
      cuisine: 'American • Cafe',
      deliveryTime: '25min',
      rating: '4.5',
      deliverytext: 'Free delivery',
    ),

    Partner(
      image: AssetsManager.BG3,
      name: 'The Halal Guys',
      location: 'Hay Street, Perth City',
      cuisine: 'Italian',
      deliveryTime: '30min',
      rating: '4.3',
      deliverytext: 'Free delivery',
    ),

  ];

  List<Partner> get partners => _partners;
}
