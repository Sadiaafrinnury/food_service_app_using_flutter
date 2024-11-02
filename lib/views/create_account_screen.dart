import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';
import '../provider/createaccountprovider.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpProvider>(context);

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
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Enter your Name, Email and Password for sign up.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  // Navigate to Sign In Screen
                  Navigator.pop(context); // Adjust navigation as needed
                },
                child: Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.orange, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 24),
              TextField(
                onChanged: signUpProvider.setFullName,
                decoration: InputDecoration(
                  labelText: 'FULL NAME',
                  suffixIcon: Icon(Icons.check, color: Colors.green),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: signUpProvider.setEmail,
                decoration: InputDecoration(
                  labelText: 'EMAIL ADDRESS',
                  suffixIcon: Icon(Icons.check, color: Colors.green),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: signUpProvider.setPassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  suffixIcon: Icon(Icons.visibility, color: Colors.black),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: signUpProvider.validateForm()
                      ? () {
                    signUpProvider.goToPhoneLoginScreen(context);
                  }
                      : null, // Disable button if form is invalid
                  child: Text(
                      'SIGN UP',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'By Signing up you agree to our Terms Conditions & Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 16),
              Center(child: Text('Or', style: TextStyle(fontSize: 16))),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.facebook, color: Colors.white),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                  ),
                  onPressed: () {
                    // Handle Facebook sign-in
                  },
                  label: Text(
                      'CONNECT WITH FACEBOOK',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
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
                  label: Text(
                      'CONNECT WITH GOOGLE',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}
