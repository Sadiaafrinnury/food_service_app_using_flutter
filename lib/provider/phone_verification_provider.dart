import 'package:flutter/material.dart';

class PhoneVerificationProvider with ChangeNotifier {
  String _verificationCode = '';

  String get verificationCode => _verificationCode;

  void setVerificationCode(String code) {
    _verificationCode = code;
    notifyListeners();
  }

  // Inside your verifyCode function in PhoneVerificationProvider
  void verifyCode(BuildContext context) {
    if (_verificationCode.length == 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verification Successful!')),
      );
      Navigator.pushNamed(context, '/findRestaurant');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 4-digit code.')),
      );
    }
  }

  void resendCode() {
    // Simulate resending the code
    notifyListeners();
  }
}
