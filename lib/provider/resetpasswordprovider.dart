import 'package:flutter/material.dart';

class ResetPasswordProvider with ChangeNotifier {
  String? _email;

  String? get email => _email;

  void setEmail(String email) {
    _email = email;
    notifyListeners(); // Notify listeners when the email changes
  }

  Future<bool> sendResetEmail() async {
    try {
      // Simulate sending an email (replace this with your actual logic)
      await Future.delayed(Duration(seconds: 2)); // Simulating a network call

      // Here, implement the actual sending logic.
      // For example, make an API call to send the email using _email.
      if (_email == null || _email!.isEmpty) {
        throw Exception('Email address is not set.');
      }

      print('Reset email sent to $_email'); // Debugging line
      return true; // Return true if successful
    } catch (e) {
      print('Error sending email: $e'); // Log the error for debugging
      return false; // Return false if there was an error
    }
  }
}

