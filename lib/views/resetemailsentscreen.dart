import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';
import 'package:tamang_food_service_food_ordering_app/views/create_account_screen.dart';
import 'package:tamang_food_service_food_ordering_app/views/sign_in_screen.dart';
import '../provider/resetpasswordprovider.dart';

class ResetEmailSentScreen extends StatelessWidget {
  final String email; // Define email as a final field

  // Constructor to accept email
  ResetEmailSentScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    final resetPasswordProvider = Provider.of<ResetPasswordProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Forgot Password'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset email sent',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'We have sent an instructions email to $email.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              TextButton(
                onPressed: () {
                  final resetPasswordProvider =
                  Provider.of<ResetPasswordProvider>(context, listen: false);

                  // Optional: perform any actions with the provider, like resetting email
                  resetPasswordProvider.setEmail(''); // Example action

                  // Navigate to SignInScreen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAccountScreen(),
                    ),
                  );
                },
                child: Text(
                  "Having problem?",
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () async {
                    bool success = await resetPasswordProvider.sendResetEmail();
                    if (success) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to send reset email')),
                      );
                    }
                  },
                  child: Text(
                    'SEND AGAIN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Image.asset(
                  AssetsManager.OpenDoodles,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


