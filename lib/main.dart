import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:carma_app/src/features/mechanic_app/mechanic_auth/mechanic_Signup.dart';
import 'package:carma_app/src/features/mechanic_app/mechanic_auth/mechanic_work_experience.dart';
import 'package:carma_app/src/features/mechanic_app/mechanic_home/mechanic_home_screen.dart';
import 'package:carma_app/src/features/mechanic_app/mechanic_services/claim_jobs.dart';
import 'package:carma_app/src/features/mechanic_app/mechanic_services/mechanic_history.dart';
import 'package:carma_app/src/features/mechanic_app/mechanic_services/on_a_job.dart';
import 'package:carma_app/src/features/mechanic_app/mechanic_services/schedule.dart';
import 'package:carma_app/src/features/mechanic_app/mechanic_user/mechanic_profile.dart';
import 'package:carma_app/src/features/user_app/auth/presentation/login/loginPage.dart';
import 'package:carma_app/src/features/user_app/auth/presentation/sign_up/signupPage.dart';
import 'package:carma_app/src/features/user_app/chat/chat.dart';
import 'package:carma_app/src/features/user_app/chat/chat_view.dart';
import 'package:carma_app/src/features/user_app/home/homePage.dart';
import 'package:carma_app/src/features/user_app/notification/notification.dart';
import 'package:carma_app/src/features/user_app/notification/notification_body.dart';
import 'package:carma_app/src/features/user_app/scanner/scanner.dart';
import 'package:carma_app/src/features/user_app/scanner/scanner_history.dart';
import 'package:carma_app/src/features/user_app/scanner/scanner_livedata.dart';
import 'package:carma_app/src/features/user_app/scanner/wear_items.dart';
import 'package:carma_app/src/features/user_app/services/add_garage_screen.dart';
import 'package:carma_app/src/features/user_app/services/booking_screen.dart';
import 'package:carma_app/src/features/user_app/services/first_time_users.dart';
import 'package:carma_app/src/features/user_app/services/my_garage_screen.dart';
import 'package:carma_app/src/features/user_app/services/post_inspection_screen.dart';
import 'package:carma_app/src/features/user_app/services/returning_customer_Screen.dart';
import 'package:carma_app/src/features/user_app/services/serviceScreen.dart';
import 'package:carma_app/src/features/user_app/services/user_booking_history_screen.dart';
import 'package:carma_app/src/features/user_app/user/profile_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}
