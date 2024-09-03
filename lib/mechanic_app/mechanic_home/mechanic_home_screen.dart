import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MechanicHomeScreen extends StatelessWidget {
  const MechanicHomeScreen({super.key});

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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/graylogo1.png'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Babalola',
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '3.45',
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset('assets/images/speaker.png'),
                  const SizedBox(width: 10),
                  Container(
                    height: 30,
                    width: 332,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 217, 217, 217)),
                    child: Text(
                      'Get your latest subscription box at www.ca',
                      style: GoogleFonts.inder(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/garage.png'),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 149, 149, 149),
                            )
                          ],
                        ),
                        Text(
                          'Claim jobs',
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
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.4)),
                        ),
                      ],
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/service.png'),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromARGB(255, 149, 149, 149),
                            )
                          ],
                        ),
                        Text(
                          'Schedule',
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
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/chat.png'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Reach out to us at ',
                    style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'www.carmagaad.com',
                    style: GoogleFonts.inder(
                        color: const Color.fromARGB(255, 243, 148, 30),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                'for more enquiries',
                style: GoogleFonts.inder(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
