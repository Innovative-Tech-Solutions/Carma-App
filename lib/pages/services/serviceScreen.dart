import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/backbutton.png',
              ),
              const SizedBox(height: 20),
              Text(
                'Fix your convenient schedule',
                style: GoogleFonts.inder(
                    color: const Color.fromARGB(255, 243, 148, 30),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Card(
                    elevation: 4,
                    child: Container(
                      height: 38,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Date',
                            style: GoogleFonts.inder(
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Card(
                    elevation: 4,
                    child: Container(
                      height: 38,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Time',
                            style: GoogleFonts.inder(
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 38,
                      width: 260,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'City/Home address',
                            style: GoogleFonts.inder(
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Use Location?',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Turn on GPS',
                    style: GoogleFonts.inder(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 45,
                          width: 175,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 217, 217, 217)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Cost',
                                style: GoogleFonts.inder(),
                              ),
                              Text(
                                '\$\$',
                                style: GoogleFonts.inder(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Card(
                        elevation: 4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          height: 45,
                          width: 114,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 217, 217, 217)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Offers',
                                style: GoogleFonts.inder(),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.4),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: Text(
                      'Join our popular subscription offers!',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/services1.png'),
                      Image.asset('assets/images/services2.png'),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 38,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 148, 30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // ignore: prefer_const_constructors
                    child: Center(
                        child: Text(
                      'Next',
                      style: GoogleFonts.inder(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    )),
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
