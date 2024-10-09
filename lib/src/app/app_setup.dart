import 'package:carma_app/src/features/user_app/auth/presentation/sign_up/signupPage.dart';
import 'package:carma_app/src/features/user_app/home/presentation/home/homePage.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: SignUpPage, initial: true),
    AdaptiveRoute(page: HomePage)
  ],
  logger: StackedLogger(),
)
class AppSetup {}
