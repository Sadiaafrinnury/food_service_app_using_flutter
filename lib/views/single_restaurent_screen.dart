import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:tamang_food_service_food_ordering_app/provider/menuprovider.dart';
import 'package:tamang_food_service_food_ordering_app/views/add_to_order_screen.dart';
import '../provider/see_all_partner_page1_provider.dart';
import '../provider/single_restaurent_provider.dart';

class SingleRestaurantScreen extends StatefulWidget {
  final Partner partner;

  const SingleRestaurantScreen({Key? key, required this.partner}) : super(key: key);

  @override
  _SingleRestaurantScreenState createState() => _SingleRestaurantScreenState();
}

class _SingleRestaurantScreenState extends State<SingleRestaurantScreen> {
  int _currentIndex = 0;
  final int _totalImages = 5;

  @override
  Widget build(BuildContext context) {
    // Access the provider to get the list of food items
    final categoryProvider = Provider.of<SingleRestaurentProvider>(context);
    final foodItems = categoryProvider.foodItems;
    final categories = categoryProvider.categories;
    final highlightedCategory = categoryProvider.highlightedCategory;
    final foodProvider = Provider.of<FoodProvider>(context);

    // Filter food items based on the highlighted category
    final filteredFoodItems = foodProvider.foodItems.where(
          (item) => item.category == foodProvider.highlightedCategory,
    ).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
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
                          widget.partner.image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: DotsIndicator(
                      dotsCount: _totalImages,
                      position: _currentIndex,
                      decorator: DotsDecorator(
                        activeColor: Colors.white,
                        color: Colors.grey,
                        size: const Size.square(8.0),
                        activeSize: const Size(12.0, 12.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: Container(
                    width: 330,
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.grey, size: 20),
                      ),
                      style: TextStyle(fontSize: 14),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 230),
              child: Text(
                widget.partner.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "\$\$     •     Chinese     •     American     •     Deshi food",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(widget.partner.rating),
                  SizedBox(width: 20),
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "200+ Ratings",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.attach_money, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Free\nDelivery",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.lock_clock, color: Colors.white),
                  ),
                  SizedBox(width: 20),
                  Text(
                    widget.partner.deliveryTime,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Take away',
                      style: TextStyle(fontSize: 12, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 270),
              child: Text(
                "Featured Items",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodItems.length,
                  itemBuilder: (context, index) {
                    final item = foodItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                                width: 150,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "${item.price} • ${item.category}",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodProvider.categories.length,
                  itemBuilder: (context, index) {
                    final category = foodProvider.categories[index];
                    final isHighlighted = category == foodProvider.highlightedCategory;

                    return GestureDetector(
                      onTap: () {
                        // Set highlighted category on tap
                        foodProvider.setHighlightedCategory(category);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
                            color: isHighlighted ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 270),
              child: Text(
                "Most Populars",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                height: 250,  // Adjust this height according to your needs
                child: ListView.builder(
                  itemCount: foodProvider.foodItems.length,
                  itemBuilder: (context, index) {
                    final item = foodProvider.foodItems[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddToOrderPage(),));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  item.description,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                SizedBox(height: 4),
                                Text(item.category, style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 4),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Text(item.price, style: TextStyle(color: Colors.orange)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 270),
              child: Text(
                "Sea Foods",
                style: TextStyle(
                    fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: SizedBox(
                height: 250,  // Adjust this height according to your needs
                child: ListView.builder(
                  itemCount: foodProvider.seafoodItems.length,
                  itemBuilder: (context, index) {
                    final item = foodProvider.seafoodItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              SizedBox(height: 4),
                              Text(
                                item.description,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              SizedBox(height: 4),
                              Text(item.category, style: TextStyle(color: Colors.grey)),
                              SizedBox(height: 4),
                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Text(item.price, style: TextStyle(color: Colors.orange)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






