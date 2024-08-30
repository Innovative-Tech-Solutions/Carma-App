import 'package:carma_app/pages/auth/loginPage.dart';
import 'package:carma_app/pages/auth/signupPage.dart';
import 'package:carma_app/pages/home/homePage.dart';
import 'package:carma_app/pages/services/first_time_users.dart';
import 'package:carma_app/pages/services/returning_customer_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReturningCustomerScreen(),
    );
  }
}
