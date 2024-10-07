import 'package:carma_app/src/features/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MechanicSignUpScreen extends StatefulWidget {
  const MechanicSignUpScreen({super.key});

  @override
  State<MechanicSignUpScreen> createState() => _MechanicSignUpScreenState();
}

class _MechanicSignUpScreenState extends State<MechanicSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User information',
          style: GoogleFonts.inter(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: 20,
              //   color: const Color.fromARGB(255, 243, 148, 30),
              // ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/carmalogo.png'),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Names',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintStyle: GoogleFonts.openSans(
                                fontStyle: FontStyle.italic),
                            hintText: 'Surname'),
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
                            hintText: 'First name'),
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
                            hintText: 'Other names'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Contact info',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Phone number',
                          hintStyle:
                              GoogleFonts.openSans(fontStyle: FontStyle.italic),
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
                            hintText: 'Country'),
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
                            hintText: 'Residential Address'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Certifications',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Ex. BSc Mech Engineering 2017',
                          hintStyle:
                              GoogleFonts.openSans(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const CustomButton(buttonTitle: 'Continue'),
            ],
          ),
        ),
      ),
    );
  }
}
