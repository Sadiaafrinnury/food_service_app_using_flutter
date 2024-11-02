import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  String? _emailError;
  String? _passwordError;

  bool get isLoading => _isLoading;
  bool get sPasswordVisible => _isPasswordVisible;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void signIn(String email, String password, BuildContext context) {
    _isLoading = true;
    _emailError = null;
    _passwordError = null;
    notifyListeners();

    Future.delayed(Duration(seconds: 2), () {
      _isLoading = false;
      if (email.isEmpty || !email.contains('@')) {
        _emailError = 'Invalid email address';
      } else if (password.isEmpty || password.length < 6) {
        _passwordError = "Password must be at least 6 characters";
      } else {
        Navigator.of(context).pushReplacementNamed('/home');
      }
      notifyListeners();
    });
  }
}
