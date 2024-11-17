import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';
import '../provider/createaccountprovider.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Forgot Password'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your Name, Email and Password for sign up.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to Sign In Screen
                  Navigator.pop(context); // Adjust navigation as needed
                },
                child: const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.orange, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                onChanged: signUpProvider.setFullName,
                decoration: const InputDecoration(
                  labelText: 'FULL NAME',
                  suffixIcon: Icon(Icons.check, color: Colors.green),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: signUpProvider.setEmail,
                decoration: const InputDecoration(
                  labelText: 'EMAIL ADDRESS',
                  suffixIcon: Icon(Icons.check, color: Colors.green),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: signUpProvider.setPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'PASSWORD',
                  suffixIcon: Icon(Icons.visibility, color: Colors.black),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: signUpProvider.validateForm()
                      ? () {
                          signUpProvider.goToPhoneLoginScreen(context);
                        }
                      : null, // Disable button if form is invalid
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'By Signing up you agree to our Terms Conditions & Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              const Center(child: Text('Or', style: TextStyle(fontSize: 16))),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                  ),
                  onPressed: () {
                    // Handle Facebook sign-in
                  },
                  label: const Text(
                    'CONNECT WITH FACEBOOK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Image.asset(
                    AssetsManager.googlelogo,
                    height: 20,
                    width: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    // Handle Google sign-in
                  },
                  label: const Text(
                    'CONNECT WITH GOOGLE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
