import 'package:flutter/material.dart';

class SignUpProvider with ChangeNotifier {
  String _fullName = '';
  String _email = '';
  String _password = '';

  String get fullName => _fullName;
  String get email => _email;
  String get password => _password;

  void setFullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  bool validateForm() {
    return _fullName.isNotEmpty && _email.isNotEmpty && _password.isNotEmpty;
  }

  void goToPhoneLoginScreen(BuildContext context) {
    // Navigate to PhoneLoginScreen
    Navigator.pushReplacementNamed(context, '/phoneLogin'); // Adjust the route name accordingly
  }
}
