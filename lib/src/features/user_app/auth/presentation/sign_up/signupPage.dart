import 'package:carma_app/src/core/services/user_service.dart';
import 'package:carma_app/src/core/utils/logger.dart';
import 'package:carma_app/src/core/utils/service_locator.dart';
import 'package:carma_app/src/features/components/custom_button.dart';
import 'package:carma_app/src/features/components/custom_signup_button.dart';
import 'package:carma_app/src/features/user_app/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:carma_app/src/features/user_app/auth/domain/repository/auth_repo.dart';
import 'package:carma_app/src/features/user_app/auth/presentation/sign_up/sign_up_vm.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(
          authRepository: locator<AuthRepository>(),
          userService: locator<UserService>()),
      builder: (context, viewModel, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 148, 30),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _signUpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 20,
                  //   color: const Color.fromARGB(255, 243, 148, 30),
                  // ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Welcome, ',
                            style: GoogleFonts.openSans(
                              color: const Color.fromARGB(255, 243, 148, 30),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'user',
                            style: GoogleFonts.openSans(
                              fontSize: 30,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Image.asset('assets/images/carmalogo.png'),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintStyle: GoogleFonts.openSans(
                                    fontStyle: FontStyle.italic),
                                hintText: 'Full name'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintStyle: GoogleFonts.openSans(
                                    fontStyle: FontStyle.italic),
                                hintText: 'Username'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintStyle: GoogleFonts.openSans(
                                    fontStyle: FontStyle.italic),
                                hintText: 'Email'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'Phone number',
                              hintStyle: GoogleFonts.openSans(
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintStyle: GoogleFonts.openSans(
                                    fontStyle: FontStyle.italic),
                                hintText: 'Password'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintStyle: GoogleFonts.openSans(
                                    fontStyle: FontStyle.italic),
                                hintText: 'Confirm Password'),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            Text(
                              'I have read and accepted all terms and conditions',
                              style: GoogleFonts.openSans(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CustomButton(
                        buttonTitle: 'Sign up',
                        onTap: () async {
                          AppLogger.log("Button tapped");
                          if (_signUpFormKey.currentState?.validate() ??
                              false) {
                            await viewModel.registerUser();
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 119,
                            height: 1,
                            color: Colors.black,
                          ),
                          Text(
                            'or sign in with',
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            width: 119,
                            height: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const CustomSignupButton(
                        title: 'Google',
                        icon: FontAwesomeIcons.google,
                      ),
                      const SizedBox(height: 10),
                      const CustomSignupButton(
                        title: 'Facebook',
                        icon: FontAwesomeIcons.facebook,
                      ),
                      const SizedBox(height: 10),
                      const CustomSignupButton(
                        title: 'Apple',
                        icon: FontAwesomeIcons.apple,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
