import 'package:carma_app/src/features/user_app/auth/presentation/sign_up/signupPage.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: SignUpPage, initial: true)
], dependencies: [
  // LazySingleton(classType: DioService),
  // LazySingleton(classType: UserService)
])
class AppSetup {}
