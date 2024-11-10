import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:carma_app/src/features/user_app/notification/domain/repository/notification_repo.dart';
import 'package:carma_app/src/features/user_app/home/presentation/home/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(
            notificationRepository: locator<NotificationRepository>(),
            navigationService: locator<NavigationService>()),
        builder: (context, viewModel, _) => Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 243, 148, 30),
              ),
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => viewModel.goToNotificationsScreen(),
                            child: Badge(
                              isLabelVisible:
                                  viewModel.getNotificationBadgeStatus,
                              child: const FaIcon(
                                FontAwesomeIcons.solidBell,
                                color: Color.fromARGB(255, 243, 148, 30),
                              ),
                            ),
                          ),
                          Image.asset('assets/images/carmalogo.png')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () => viewModel.goToProfileScreen(),
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage('assets/images/profile.png'),
                                ),
                              ),
                              Text(
                                'Hi, JOHN',
                                style: GoogleFonts.openSans(
                                  fontSize: 17,
                                  color:
                                      const Color.fromARGB(255, 243, 148, 30),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset('assets/images/chat.png'),
                              Row(
                                children: [
                                  Image.asset('assets/images/speaker.png'),
                                  Text(
                                    'Popular Subscriptions',
                                    style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/car1.png'),
                          Image.asset('assets/images/car2.png'),
                          Image.asset('assets/images/car3.png'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => viewModel.goToGarageScreen(),
                        child: Card(
                          elevation: 4,
                          child: Container(
                            height: 167,
                            width: 345,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 232, 228, 228),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset('assets/images/garage.png'),
                                      const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color:
                                            Color.fromARGB(255, 149, 149, 149),
                                      )
                                    ],
                                  ),
                                  Text(
                                    'Garage',
                                    style: GoogleFonts.openSans(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Hire someone to do the job for you',
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)
                                                .withOpacity(0.4)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Card(
                        elevation: 4,
                        child: Container(
                          height: 167,
                          width: 345,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 232, 228, 228),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/images/service.png'),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color.fromARGB(255, 149, 149, 149),
                                    )
                                  ],
                                ),
                                Text(
                                  'Service',
                                  style: GoogleFonts.openSans(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'What would you like to get done',
                                  style: GoogleFonts.openSans(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromARGB(255, 0, 0, 0)
                                          .withOpacity(0.4)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
