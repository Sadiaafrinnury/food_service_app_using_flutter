import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';
import 'package:tamang_food_service_food_ordering_app/provider/walkthroughprovider.dart';

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WalkthroughProvider(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF4EDEB),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Consumer<WalkthroughProvider>(
                builder: (context, provider, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetsManager.g12, // Logo asset
                            height: 50,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Tamang\nFoodService',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Image.asset(
                        AssetsManager
                            .Illustration1, // Replace with your walkthrough illustration path
                        height: 300,
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'All your favorites',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Order from the best local restaurants\nwith easy, on-demand delivery.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 4, backgroundColor: Colors.green),
                          SizedBox(width: 4),
                          CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                          SizedBox(width: 4),
                          CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                        ],
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          provider.goToHomeScreen(
                              context); // Navigate using provider
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFFC107),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'GET STARTED',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
