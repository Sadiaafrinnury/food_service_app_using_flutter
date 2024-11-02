import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/enter_address_provider.dart';



class FindRestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Find restaurants near you"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Find restaurants near you",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              "Please enter your location or allow access to your location to find restaurants near you.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () {
                // Navigate to TypeLocationScreen using Provider
                locationProvider.goToTypeLocationScreen(context);
              },
              icon: Icon(Icons.my_location, color: Colors.orange),
              label: Text(
                "Use current location",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                hintText: "Enter a new address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
              onChanged: (query) => locationProvider.fetchSuggestions(query),
            ),
            SizedBox(height: 16),

            // List of suggestions
            Consumer<LocationProvider>(
              builder: (context, locationProvider, child) {
                return locationProvider.suggestions.isNotEmpty
                    ? Expanded(
                  child: ListView.builder(
                    itemCount: locationProvider.suggestions.length,
                    itemBuilder: (context, index) {
                      final suggestion = locationProvider.suggestions[index];
                      return ListTile(
                        leading: Icon(Icons.location_on, color: Colors.orange),
                        title: Text(suggestion),
                        onTap: () => locationProvider.selectAddress(suggestion),
                      );
                    },
                  ),
                )
                    : SizedBox.shrink();
              },
            ),

            // Display selected address if available
            Consumer<LocationProvider>(
              builder: (context, locationProvider, child) {
                return locationProvider.address != null
                    ? Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Selected Address: ${locationProvider.address}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
                    : SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}



