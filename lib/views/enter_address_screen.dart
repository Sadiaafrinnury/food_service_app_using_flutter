import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/enter_address_provider.dart';

class FindRestaurantScreen extends StatelessWidget {
  const FindRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Find restaurants near you"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Find restaurants near you",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Please enter your location or allow access to your location to find restaurants near you.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () {
                // Navigate to TypeLocationScreen using Provider
                locationProvider.goToTypeLocationScreen(context);
              },
              icon: const Icon(Icons.my_location, color: Colors.orange),
              label: const Text(
                "Use current location",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on),
                hintText: "Enter a new address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
              onChanged: (query) => locationProvider.fetchSuggestions(query),
            ),
            const SizedBox(height: 16),

            // List of suggestions
            Consumer<LocationProvider>(
              builder: (context, locationProvider, child) {
                return locationProvider.suggestions.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: locationProvider.suggestions.length,
                          itemBuilder: (context, index) {
                            final suggestion =
                                locationProvider.suggestions[index];
                            return ListTile(
                              leading: const Icon(Icons.location_on,
                                  color: Colors.orange),
                              title: Text(suggestion),
                              onTap: () =>
                                  locationProvider.selectAddress(suggestion),
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink();
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
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
