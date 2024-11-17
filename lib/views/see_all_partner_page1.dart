import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/see_all_partner_page1_provider.dart';
import 'package:tamang_food_service_food_ordering_app/views/single_restaurent_screen.dart';

class SeeAllPartnerPage1 extends StatelessWidget {
  const SeeAllPartnerPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SeeAllPartnerPage1Provider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Featured Partners',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<SeeAllPartnerPage1Provider>(
            builder: (context, provider, child) {
              return GridView.builder(
                padding: EdgeInsets.only(bottom: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: provider.partners.length,
                itemBuilder: (context, index) {
                  final partner = provider.partners[index];
                  return PartnerCard(partner: partner);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class PartnerCard extends StatelessWidget {
  final Partner partner;

  const PartnerCard({Key? key, required this.partner}) : super(key: key);

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
              GestureDetector(
                onTap: () {
                  // Navigate to the next page when the image is clicked
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SingleRestaurantScreen(partner: partner),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    partner.image,
                    height: 210,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          partner.deliveryTime,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.money_off, color: Colors.white, size: 16),
                        SizedBox(width: 4),
                        Text(
                          partner.deliverytext,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    partner.rating,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    partner.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    partner.cuisine,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

