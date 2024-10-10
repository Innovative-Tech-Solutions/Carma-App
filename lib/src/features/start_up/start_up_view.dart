import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:carma_app/src/core/utils/session_manager.dart';
import 'package:carma_app/src/core/utils/sizer.dart';
import 'package:carma_app/src/features/start_up/start%20_up_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(
          navigationService: locator<NavigationService>(),
          sessionManager: locator<SessionManager>(),
          userService: locator<UserService>()),
      onViewModelReady: (model) => model.handleStartupLogic(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: Colors.black,
        ),
      ),
    );
  }
}
