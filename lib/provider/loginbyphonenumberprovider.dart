import 'package:flutter/material.dart';

class PhoneLoginProvider with ChangeNotifier {
  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  bool isPhoneNumberValid() {
    return _phoneNumber.isNotEmpty &&
        _phoneNumber.length > 8; // Basic validation
  }

  void signUp(BuildContext context) {
    if (isPhoneNumberValid()) {
      // Implement your sign-up logic here
      // For example, navigate to the next screen
      Navigator.pushNamed(context, '/phoneVerification');
    } else {
      // Show error if phone number is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid phone number')),
      );
    }
  }
}
