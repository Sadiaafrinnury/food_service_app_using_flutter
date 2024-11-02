import 'package:flutter/material.dart';

class ForgotPasswordProvider with ChangeNotifier {
  late String _email;

  void setEmail(String email) {
    _email = email;
  }

  Future<bool> sendResetEmail() async {
    try {
      // Simulate sending email logic (e.g., API call)
      await Future.delayed(Duration(seconds: 2)); // Simulating network delay
      // Logic to send email goes here (using _email)
      print('Reset email sent to $_email'); // For debugging
      return true; // Return true if the email is sent successfully
    } catch (e) {
      print('Error sending email: $e');
      return false; // Return false if there was an error
    }
  }
}


