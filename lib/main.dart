import 'package:carma_app/pages/auth/loginPage.dart';
import 'package:carma_app/pages/auth/signupPage.dart';
import 'package:carma_app/pages/home/homePage.dart';
import 'package:carma_app/pages/notification/notification.dart';
import 'package:carma_app/pages/notification/notification_body.dart';
import 'package:carma_app/pages/scanner/scanner.dart';
import 'package:carma_app/pages/scanner/scanner_history.dart';
import 'package:carma_app/pages/scanner/scanner_livedata.dart';
import 'package:carma_app/pages/scanner/wear_items.dart';
import 'package:carma_app/pages/services/add_garage_screen.dart';
import 'package:carma_app/pages/services/booking_screen.dart';
import 'package:carma_app/pages/services/first_time_users.dart';
import 'package:carma_app/pages/services/my_garage_screen.dart';
import 'package:carma_app/pages/services/post_inspection_screen.dart';
import 'package:carma_app/pages/services/returning_customer_Screen.dart';
import 'package:carma_app/pages/services/serviceScreen.dart';
import 'package:carma_app/pages/services/user_booking_history_screen.dart';
import 'package:carma_app/pages/user/profile_screen.dart';
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
      home: ScannerLiveDataScreen(),
    );
  }
}
