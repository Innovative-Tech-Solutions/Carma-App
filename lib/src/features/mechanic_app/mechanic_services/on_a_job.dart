import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnAJobScreen extends StatefulWidget {
  const OnAJobScreen({super.key});

  @override
  State<OnAJobScreen> createState() => _OnAJobScreenState();
}

class _OnAJobScreenState extends State<OnAJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car image and Time In/Out dropdowns
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Car image
                  Image.asset(
                    'assets/images/garage1.png', // Replace with your car image asset
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  // Time In and Time Out
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: 112,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Time in',
                              style: GoogleFonts.inder(fontSize: 15),
                            ),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 30,
                        width: 112,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Time out',
                              style: GoogleFonts.inder(fontSize: 15),
                            ),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      )
                    ],
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     DropdownButton<String>(
                  //       value: "Time in",
                  //       items: const [
                  //         DropdownMenuItem(
                  //           value: "Time in",
                  //           child: Text("Time in"),
                  //         ),
                  //         // Add more options here if needed
                  //       ],
                  //       onChanged: (value) {},
                  //     ),
                  //     const SizedBox(height: 8),
                  //     DropdownButton<String>(
                  //       value: "Time out",
                  //       items: const [
                  //         DropdownMenuItem(
                  //           value: "Time out",
                  //           child: Text("Time out"),
                  //         ),
                  //         // Add more options here if needed
                  //       ],
                  //       onChanged: (value) {},
                  //     ),
                  //   ],
                  // ),

                  Image.asset('assets/images/clock.png')
                ],
              ),
              const SizedBox(height: 16),
              // User Info and Car details
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                            'assets/images/user.png'), // Replace with actual avatar image
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Kim Tasha',
                        style: GoogleFonts.inder(fontSize: 20),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/carlogo.svg'),
                      const SizedBox(width: 5),
                      Text(
                        'Benz GLE',
                        style: GoogleFonts.inder(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/locationlogo.svg'),
                      const SizedBox(width: 5),
                      Text(
                        'Ajah Lekki',
                        style: GoogleFonts.inder(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/brakeslogo.svg'),
                      const SizedBox(width: 5),
                      Text(
                        'Failing cylinder\nWorn brakes pads',
                        style: GoogleFonts.inder(fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Upload Pics section
              Text(
                'Upload Pics',
                style: GoogleFonts.inder(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 243, 148, 30),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(Icons.add, size: 40, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              // Wrong Parts section
              Text(
                'Wrong Parts?',
                style: GoogleFonts.inder(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 243, 148, 30),
                ),
              ),
              const SizedBox(height: 8),
              // Feedback Form
              TextField(
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.inder(
                    fontSize: 20,
                  ),
                  hintText: 'Send a Feedback',
                  suffixIcon: const Icon(Icons.edit, color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              // Submit Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.inder(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Need help text
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Need help?',
                  style: GoogleFonts.inder(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 243, 148, 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
