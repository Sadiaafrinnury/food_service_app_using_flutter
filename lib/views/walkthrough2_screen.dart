import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';
import 'package:tamang_food_service_food_ordering_app/provider/walkthroghprovider2.dart';


class Walkthrough2Screen extends StatelessWidget {
  const Walkthrough2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => WalkthroughProvider(),
      child: Scaffold(
        backgroundColor: Color(0xFFF4EDEB),
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
                          SizedBox(width: 10),
                          Text(
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
                      SizedBox(height: 30),


                      Image.asset(
                        AssetsManager.Illustration3, // Replace with your walkthrough illustration path
                        height: 300,
                      ),

                      SizedBox(height: 30),


                      Text(
                        'Free delivery offers',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 10),


                      Text(
                        'Free delivery for new customers via Apple Pay\nand others payment methods..',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),

                      SizedBox(height: 20),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                          SizedBox(width: 4),
                          CircleAvatar(radius: 4, backgroundColor: Colors.green),
                          SizedBox(width: 4),
                          CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                        ],
                      ),

                      SizedBox(height: 40),


                      ElevatedButton(
                        onPressed: () {
                          provider.goToHomeScreen(context); // Navigate using provider
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