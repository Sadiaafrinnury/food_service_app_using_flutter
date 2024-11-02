import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/createaccountprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/enter_address_provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/loginbyphonenumberprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/phone_verification_provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/resetpasswordprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/singninprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/type_location_provider.dart';
import 'package:tamang_food_service_food_ordering_app/views/create_account_screen.dart';
import 'package:tamang_food_service_food_ordering_app/views/enter_address_screen.dart';
import 'package:tamang_food_service_food_ordering_app/views/login_by_phone_number_screen.dart';
import 'package:tamang_food_service_food_ordering_app/views/phone_verification_screen.dart';
import 'package:tamang_food_service_food_ordering_app/views/welcome_page.dart';
import 'package:tamang_food_service_food_ordering_app/provider/forgotpasswordprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
        ChangeNotifierProvider(create: (_) => ResetPasswordProvider()),
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => PhoneLoginProvider()),
        ChangeNotifierProvider(create: (_) => PhoneVerificationProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => TypeLocationProvider()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/phoneLogin': (context) => PhoneLoginScreen(),
          '/phoneVerification': (context) => PhoneVerificationScreen(),
          '/findRestaurant': (context) => FindRestaurantScreen(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
