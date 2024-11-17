import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts/image_consts.dart';
import '../provider/see_all_part_page3_provider.dart';


class SeeAllPartnerPage3 extends StatelessWidget {
  const SeeAllPartnerPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SeeAllPartnerPage3Provider(), // Use the correct provider
      child: Scaffold(
        body: Column(
          children: [
            // Map and search bar section
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.asset(
                    AssetsManager.Map1,
                    fit: BoxFit.cover,
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        icon: Icon(Icons.search, color: Colors.grey, size: 20),
                      ),
                      style: TextStyle(fontSize: 14),
                      onChanged: (value) {
                        // Add search functionality here
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Top Pick Restaurants",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Consumer<SeeAllPartnerPage3Provider>(
              builder: (context, provider, child) {
                return Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryButton(
                        title: 'BURGERS',
                        isSelected: provider.selectedIndex == 0,
                        onTap: () => provider.updateSelectedIndex(0),
                      ),
                      CategoryButton(
                        title: 'BRUNCH',
                        isSelected: provider.selectedIndex == 1,
                        onTap: () => provider.updateSelectedIndex(1),
                      ),
                      CategoryButton(
                        title: 'BREAKFAST',
                        isSelected: provider.selectedIndex == 2,
                        onTap: () => provider.updateSelectedIndex(2),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<SeeAllPartnerPage3Provider>(
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
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.orange : Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  partner.image,
                  height: 210,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
