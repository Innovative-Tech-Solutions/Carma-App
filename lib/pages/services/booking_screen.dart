import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/backbutton.png',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Add to subscription option?',
                    style: GoogleFonts.inder(
                        color: const Color.fromARGB(255, 243, 148, 30),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/bookImage.png'),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 217, 217, 217)),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 217, 217, 217)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 28,
                            ),
                            Text(
                              'Upload',
                              style: GoogleFonts.inder(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Keep building your garage!',
                    style: GoogleFonts.inder(
                        color: const Color.fromARGB(255, 243, 148, 30),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    'Confirm your Booking details',
                    style: GoogleFonts.inder(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/carlogo.svg'),
                          const SizedBox(width: 10),
                          Text(
                            'Benz',
                            style: GoogleFonts.inder(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/brakeslogo.svg'),
                          const SizedBox(width: 10),
                          Text(
                            'Brakes',
                            style: GoogleFonts.inder(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/clocklogo.svg'),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'April 30th Tuesday',
                                style: GoogleFonts.inder(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '1:00 pm',
                                style: GoogleFonts.inder(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/locationlogo.svg'),
                          const SizedBox(width: 10),
                          Text(
                            'Ikeja Lagos Nigeria',
                            style: GoogleFonts.inder(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 48,
                    width: 80,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 148, 30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // ignore: prefer_const_constructors
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: GoogleFonts.inder(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
