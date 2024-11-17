import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/add_to_order_screen_provider.dart';


class AddToOrderPage extends StatelessWidget {
  final List<String> cookieOptions = [
    'Chocolate Chip',
    'Cookies and Cream',
    'Funfetti',
    'M and M',
    'Red Velvet',
    'Peanut Butter',
    'Snickerdoodle',
    'White Chocolate Macadamia'
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food Item Image
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/BG4.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Cookie Sandwich",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "Shortbread, chocolate turtle cookies, and red velvet...",
                style: TextStyle(color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
              Text("\$\$\$ • Chinese • American • Desi food"),
              SizedBox(height: 20),
        
              // Choice of Top Cookie
              buildOptionsSection(
                context,
                title: "Choice of Top Cookie (Required)",
                options: cookieOptions,
                selectedOption: cartProvider.selectedTopCookie,
                onSelected: cartProvider.selectTopCookie,
              ),

              buildOptionsSection(
                context,
                title: "Choice of Bottom Cookie (Required)",
                options: cookieOptions,
                selectedOption: cartProvider.selectedBottomCookie,
                onSelected: cartProvider.selectBottomCookie,
              ),

              // Special Instructions
              ListTile(
                title: Text("Add Special Instructions"),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Special Instructions'),
                      content: TextField(
                        onChanged: (value) => cartProvider.updateSpecialInstructions(value),
                        decoration: InputDecoration(hintText: 'Enter instructions here...'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Done'),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Divider(),
        
              // Quantity Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Quantity", style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => cartProvider.updateQuantity(-1),
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                      Text(cartProvider.quantity.toString(), style: TextStyle(fontSize: 18)),
                      IconButton(
                        onPressed: () => cartProvider.updateQuantity(1),
                        icon: Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
        
              // Add to Order Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () {
                    // Handle adding to order
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to order!')),
                    );
                  },
                  child: Text("Add to Order (\$${cartProvider.totalPrice.toStringAsFixed(2)})"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build options section
  Widget buildOptionsSection(
      BuildContext context, {
        required String title,
        required List<String> options,
        required String? selectedOption,
        required Function(String) onSelected,
      }) {
    // Check if the title contains the "(Required)" keyword
    bool isRequired = title.toLowerCase().contains('(required)');

    // Clean up the title by removing "(Required)" if present
    String cleanTitle = title.replaceAll('(Required)', '').trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Row with "REQUIRED" label
        Row(
          children: [
            Text(
              cleanTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(width: 145),
            if (isRequired)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4E1), // Light yellow background color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'REQUIRED',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        // List of options with radio buttons
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: options.length,
          itemBuilder: (context, index) {
            String option = options[index];
            return ListTile(
              title: Text(option),
              leading: Radio<String>(
                value: option,
                groupValue: selectedOption ?? '',
                onChanged: (value) {
                  if (value != null) {
                    onSelected(value);
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
