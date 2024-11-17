import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/type_location_provider.dart';
import 'home_page.dart';

class TypeLocationScreen extends StatelessWidget {
  const TypeLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<TypeLocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Find Restaurants Near You"),
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

            // Expanded ListView for suggestions
            Expanded(
              child: Consumer<TypeLocationProvider>(
                builder: (context, locationProvider, child) {
                  return locationProvider.suggestions.isNotEmpty
                      ? ListView.builder(
                          itemCount: locationProvider.suggestions.length,
                          itemBuilder: (context, index) {
                            final suggestion =
                                locationProvider.suggestions[index];
                            return ListTile(
                              leading: const Icon(Icons.location_on,
                                  color: Colors.orange),
                              title: Text(suggestion),
                              onTap: () {
                                // When an address is selected, update the provider
                                locationProvider.selectAddress(suggestion);

                                // Navigate to HomePage and pass the selected address
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(address: suggestion),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : const SizedBox.shrink();
                },
              ),
            ),

            // Display selected address if available
            Consumer<TypeLocationProvider>(
              builder: (context, locationProvider, child) {
                return locationProvider.selectedAddress !=
                        null // Changed here to selectedAddress
                    ? Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Selected Address: ${locationProvider.selectedAddress}", // Changed here to selectedAddress
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
