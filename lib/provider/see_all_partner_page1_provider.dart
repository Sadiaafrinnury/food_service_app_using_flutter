import 'package:flutter/cupertino.dart';
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

class SeeAllPartnerPage1Provider extends ChangeNotifier{
  List<Partner> _partners = [
    Partner(
      image: AssetsManager.Featuredpartners1,
      name: 'Tacos Nanchas',
      location: 'St George Terrace, Perth',
      cuisine: 'Chinese • American',
      deliveryTime: '25min',
      rating: '4.5',
      deliverytext: 'Free',
    ),

    Partner(
      image: AssetsManager.Featuredpartners2,
      name: 'McDonalds',
      location: 'Hay Street, Perth City',
      cuisine: 'Chinese • American',
      deliveryTime: '30min',
      rating: '4.3',
      deliverytext: 'Free',
    ),
    Partner(
      image: AssetsManager.Featuredpartners3,
      name: 'KFC Foods',
      location: 'Hay Street, Perth City',
      cuisine: 'Chinese • American',
      deliveryTime: '45min',
      rating: '5.00',
      deliverytext: 'Free',
    ),
    Partner(
      image: AssetsManager.Featuredpartners4,
      name: 'Cafe MayField’s',
      location: 'Hay Street, Perth City',
      cuisine: 'Chinese • American',
      deliveryTime: '20min',
      rating: '4.00',
      deliverytext: 'Free',
    ),
    Partner(
      image: AssetsManager.Featuredpartners5,
      name: 'Cafe MayField’s',
      location: 'Hay Street, Perth City',
      cuisine: 'Chinese • American',
      deliveryTime: '20min',
      rating: '4.00',
      deliverytext: 'Free',
    ),
    Partner(
      image: AssetsManager.Featuredpartners6,
      name: 'Cafe MayField’s',
      location: 'Hay Street, Perth City',
      cuisine: 'Chinese • American',
      deliveryTime: '25min',
      rating: '4.00',
      deliverytext: 'Free',
    ),
    Partner(
      image: AssetsManager.Featuredpartners3,
      name: 'KFC Foods',
      location: 'Hay Street, Perth City',
      cuisine: 'Chinese • American',
      deliveryTime: '45min',
      rating: '5.00',
      deliverytext: 'Free',
    ),
    Partner(
      image: AssetsManager.Featuredpartners4,
      name: 'Cafe MayField’s',
      location: 'Hay Street, Perth City',
      cuisine: 'Chinese • American',
      deliveryTime: '20min',
      rating: '4.00',
      deliverytext: 'Free',
    ),

  ];

  List<Partner> get partners => _partners;
}