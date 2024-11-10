import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:carma_app/src/features/user_app/notification/domain/repository/notification_repo.dart';
import 'package:carma_app/src/features/user_app/notification/presentation/views/notifications/notifications_vm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationsViewModel>.reactive(
      viewModelBuilder: () => NotificationsViewModel(
          notificationRepository: locator<NotificationRepository>(),
          navigationService: locator<NavigationService>()),
      onViewModelReady: (viewModel) => viewModel.getUserNotifications(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 148, 30),
          leading: GestureDetector(
            onTap: () => viewModel.goBack(),
            child: Image.asset(
              'assets/images/backbutton.png',
              color: Colors.white,
            ),
          ),
          title: Column(
            children: [
              Text(
                'Notifications',
                style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'You have ${viewModel.notifications.length} notifications today',
                style: GoogleFonts.openSans(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListView(
                  children: [
                    const SizedBox(height: 16.0),
                    const Text(
                      'Today',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ...viewModel.notifications
                        .map((notification) => NotificationItem(
                              avatar: 'assets/images/user.png',
                              title: notification.type ?? '',
                              subtitle: notification.message ?? '',
                              timeAgo: notification.createdAt.toString() ?? '',
                            )),
                  ],
                ),
              ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String subtitle;
  final String timeAgo;

  const NotificationItem({
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 105,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.5),
          color: const Color.fromARGB(255, 233, 228, 228),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 30.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inder(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: const Color.fromARGB(255, 151, 151, 151),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.inder(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: const Color.fromARGB(255, 151, 151, 151),
                    ),
                  ),
                  Text(
                    timeAgo,
                    style: GoogleFonts.inder(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: const Color.fromARGB(255, 151, 151, 151),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
