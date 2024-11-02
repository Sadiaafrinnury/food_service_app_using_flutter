import 'package:flutter/material.dart';
import 'package:tamang_food_service_food_ordering_app/views/sign_in_screen.dart';


class WalkthroughProvider extends ChangeNotifier {
  void goToHomeScreen(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SignInScreen()), // Update with the target screen
    );
  }
}