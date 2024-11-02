import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamang_food_service_food_ordering_app/views/walkthrough_screen.dart';


class WelcomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  String _message = '';

  bool get isLoading => _isLoading;
  String get message => _message;

  void getStarted(BuildContext context) async {
    _isLoading = true;
    _message = '';
    notifyListeners();

    // Simulate some delay for loading
    await Future.delayed(Duration(seconds: 1));

    // Update the message after loading
    _message = 'Welcome to Tamang Food Service!';
    _isLoading = false;
    notifyListeners();
    
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => WalkthroughScreen()),
    );
  }
}