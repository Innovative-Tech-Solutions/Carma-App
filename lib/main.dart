import 'package:carma_app/src/app/app_setup.router.dart';
import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:carma_app/src/core/utils/session_manager.dart';
import 'package:carma_app/src/core/utils/setup_dialog.dart';
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
import 'package:carma_app/src/features/user_app/chat/presentation/views/chat_view/chat_view.dart';
import 'package:carma_app/src/features/user_app/chat/presentation/views/chat_room/chat_rooms_view.dart';
import 'package:carma_app/src/features/user_app/home/presentation/home/homePage.dart';
import 'package:carma_app/src/features/user_app/map_screen/map_screen.dart';
import 'package:carma_app/src/features/user_app/notification/presentation/views/notifications/notifications_view.dart';
import 'package:carma_app/src/features/user_app/notification/presentation/views/notification_body/notification_body.dart';
import 'package:carma_app/src/features/user_app/scanner/scanner.dart';
import 'package:carma_app/src/features/user_app/scanner/scanner_history.dart';
import 'package:carma_app/src/features/user_app/scanner/scanner_livedata.dart';
import 'package:carma_app/src/features/user_app/scanner/wear_items.dart';
import 'package:carma_app/src/features/user_app/garage/presentation/views/add_garage/add_garage_screen.dart';
import 'package:carma_app/src/features/user_app/services/booking_screen.dart';
import 'package:carma_app/src/features/user_app/services/first_time_users.dart';
import 'package:carma_app/src/features/user_app/garage/presentation/views/my_garage/my_garage_screen.dart';
import 'package:carma_app/src/features/user_app/services/post_inspection_screen.dart';
import 'package:carma_app/src/features/user_app/services/returning_customer_Screen.dart';
import 'package:carma_app/src/features/user_app/services/serviceScreen.dart';
import 'package:carma_app/src/features/user_app/services/user_booking_history_screen.dart';
import 'package:carma_app/src/features/user_app/user/presentation/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  setupLocator();
  setupDialogUi();
  await Hive.initFlutter();
  await Hive.openBox(localCacheBox);
  runApp(const MyApp());
}

Color primaryColor = Color.fromARGB(255, 243, 148, 30);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
      ),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      home: MapScreen(),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final scale = mediaQueryData.textScaler.clamp(
          minScaleFactor: 0.85,
          maxScaleFactor: .99,
        );
        final pixelRatio = mediaQueryData.devicePixelRatio.clamp(1.0, 4.0);
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: scale,
              devicePixelRatio: pixelRatio,
            ),
            child: child!);
      },
    );
  }
}
