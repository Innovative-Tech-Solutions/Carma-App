import 'package:carma_app/src/features/start_up/start_up_view.dart';
import 'package:carma_app/src/features/user_app/auth/presentation/login/loginPage.dart';
import 'package:carma_app/src/features/user_app/auth/presentation/sign_up/signupPage.dart';
import 'package:carma_app/src/features/user_app/chat/presentation/views/chat_room/chat_rooms_view.dart';
import 'package:carma_app/src/features/user_app/chat/presentation/views/chat_view/chat_view.dart';

import 'package:carma_app/src/features/user_app/home/presentation/home/homePage.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartUpView, initial: true),
    AdaptiveRoute(page: SignUpPage),
    AdaptiveRoute(page: HomePage),
    AdaptiveRoute(
      page: LoginPage,
    ),
    AdaptiveRoute(page: ChatRoomsView),
    AdaptiveRoute(
      page: ChatView,
    )
  ],
  logger: StackedLogger(),
)
class AppSetup {}
