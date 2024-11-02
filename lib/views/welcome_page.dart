import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';
import '../provider/welcome_provider.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>  WelcomeProvider(),
      child: Scaffold(
        backgroundColor: Color(0xFFF4EDEB),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Consumer<WelcomeProvider>(
                  builder: (context, provider, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsManager.g12,
                              height: 100,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Tamang\nFoodService',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Image.asset(
                          AssetsManager.Illustration,
                          height: 380,
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Subtitle
                        Text(
                          "It's a pleasure to meet you. We are\nexcited that you're here so let’s get "
                              "\nstarted!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 40),
                        if (provider.isLoading)
                          CircularProgressIndicator()
                        else
                          ElevatedButton(
                            onPressed: () {
                              provider.getStarted(context); // Pass context here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFC107),
                              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'GET STARTED',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        if (provider.message.isNotEmpty) ...[
                          SizedBox(height: 20),
                          Text(
                            provider.message,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ]
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
