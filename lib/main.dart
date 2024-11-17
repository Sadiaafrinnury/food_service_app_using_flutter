import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamang_food_service_food_ordering_app/consts/image_consts.dart';
import 'package:tamang_food_service_food_ordering_app/provider/add_to_order_screen_provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/best_pick_restaurentbyteam_provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/createaccountprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/enter_address_provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/home_page_provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/loginbyphonenumberprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/menuprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/phone_verification_provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/resetpasswordprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/restaurentprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/see_all_partner_page1_provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/single_restaurent_provider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/singninprovider.dart';
import 'package:tamang_food_service_food_ordering_app/provider/type_location_provider.dart';
import 'package:tamang_food_service_food_ordering_app/views/add_to_order_screen.dart';
import 'package:tamang_food_service_food_ordering_app/views/enter_address_screen.dart';
import 'package:tamang_food_service_food_ordering_app/views/login_by_phone_number_screen.dart';
import 'package:tamang_food_service_food_ordering_app/views/phone_verification_screen.dart';
import 'package:tamang_food_service_food_ordering_app/views/see_all_partner_page2.dart';
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
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => SeeAllPartnerPage1Provider()),
        ChangeNotifierProvider(create: (_) => BestPickRestaurentbyteamProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()),
        ChangeNotifierProvider(create: (_) => SingleRestaurentProvider()),
        ChangeNotifierProvider(create: (_) => FoodProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
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
