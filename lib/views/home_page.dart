import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:tamang_food_service_food_ordering_app/provider/best_pick_restaurentbyteam_provider.dart' as bestPick;
import 'package:tamang_food_service_food_ordering_app/provider/home_page_provider.dart' as homePage;
import 'package:tamang_food_service_food_ordering_app/views/see_all_partner_page1.dart';
import 'package:tamang_food_service_food_ordering_app/views/see_all_partner_page2.dart';
import 'package:tamang_food_service_food_ordering_app/views/see_all_partner_page3.dart';
import '../consts/image_consts.dart';
import '../provider/restaurentprovider.dart';
import '../provider/type_location_provider.dart';



class HomePage extends StatefulWidget {
  final String address;

  const HomePage({Key? key, required this.address}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final int _totalImages = 5;

  @override
  Widget build(BuildContext context) {
    final homePageProvider = Provider.of<homePage.HomePageProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Deliver To",
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            Consumer<TypeLocationProvider>(
              builder: (context, locationProvider, child) {
                return DropdownButton<String>(
                  value: locationProvider.selectedAddress ?? widget.address,
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.orange),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  underline: const SizedBox(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      locationProvider.selectAddress(newValue);
                    }
                  },
                  items: locationProvider.suggestions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(value),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.orange),
            onPressed: () {
              homePageProvider.openFilterDialog(context);
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: PageView.builder(
                        itemCount: _totalImages,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            AssetsManager.Header,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: DotsIndicator(
                        dotsCount: _totalImages,
                        position: _currentIndex,
                        decorator: DotsDecorator(
                          activeColor: Colors.orange,
                          color: Colors.grey,
                          size: const Size.square(8.0),
                          activeSize: const Size(12.0, 8.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSectionHeader(
                context,
                title: "Featured\nPartners",
                onSeeAllPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeeAllPartnerPage1()),
                  );
                },
              ),
              const SizedBox(height: 10),
              Consumer<homePage.HomePageProvider>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: provider.partners.map((partner) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: PartnerCard(partner: partner),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Image.asset(
                AssetsManager.Banner,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              _buildSectionHeader(
                context,
                title: "Best Picks\nRestaurants by\nteam",
                onSeeAllPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeeAllPartnerPage2()),
                  );
                },
              ),
              const SizedBox(height: 10),
              Consumer<bestPick.BestPickRestaurentbyteamProvider>(
                builder: (context, provider, child) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: provider.partners.map((partner) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: PartnerCard(partner: partner),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              _buildSectionHeader(
                context,
                title: "All Restaurants",
                onSeeAllPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeeAllPartnerPage3()),
                  );
                },
              ),
              RestaurantList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, {required String title, required VoidCallback onSeeAllPressed}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          child: const Text(
            "See all",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}


class RestaurantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: restaurantProvider.restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurantProvider.restaurants[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: RestaurantCard(restaurant: restaurant),
        );
      },
    );
  }
}

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 150,
                child: PageView.builder(
                  itemCount: widget.restaurant.imageUrl.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.asset(
                        widget.restaurant.imageUrl[index],
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Center(
                  child: DotsIndicator(
                    dotsCount: widget.restaurant.imageUrl.length,
                    position: _currentImageIndex,
                    decorator: DotsDecorator(
                      activeColor: Colors.orange,
                      color: Colors.grey,
                      size: const Size.square(6.0),
                      activeSize: const Size(12.0, 6.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.restaurant.cuisines,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      widget.restaurant.rating,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const Spacer(),
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.restaurant.deliveryTime} mins',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const Spacer(),
                    Icon(Icons.delivery_dining, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      widget.restaurant.deliveryFee,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PartnerCard extends StatelessWidget {
  final dynamic partner;

  const PartnerCard({Key? key, required this.partner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                partner.image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(partner.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(partner.location),
                  Text(partner.cuisine),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          partner.rating,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 50),
                      Text(partner.deliverytext),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          partner.deliveryTime,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





