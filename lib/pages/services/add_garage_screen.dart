import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AddGarageScreen extends StatefulWidget {
  const AddGarageScreen({super.key});

  @override
  State<AddGarageScreen> createState() => _AddGarageScreenState();
}

class _AddGarageScreenState extends State<AddGarageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/backbutton.png',
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Garage',
                      style: GoogleFonts.inder(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 35,
                        color: Color.fromARGB(255, 243, 148, 30),
                      ),
                      onPressed: () {
                        // Handle add button press
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/bookImage.png'),
                    const SizedBox(width: 20),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217)),
                      child: const Icon(
                        Icons.add,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/brakeslogo.svg'),
                    const SizedBox(width: 5),
                    Text(
                      'Description',
                      style: GoogleFonts.inder(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 217, 217, 217)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Year',
                              style: GoogleFonts.openSans(),
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
                    const SizedBox(height: 10),
                    Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 217, 217, 217)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Make',
                              style: GoogleFonts.openSans(),
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
                    const SizedBox(height: 10),
                    Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 217, 217, 217)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Model',
                              style: GoogleFonts.openSans(),
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
                    const SizedBox(height: 10),
                    Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 217, 217, 217)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Style',
                              style: GoogleFonts.openSans(),
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
                    const SizedBox(height: 10),
                    Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 217, 217, 217)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Colour',
                              style: GoogleFonts.openSans(),
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
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 243, 148, 30),
                      minimumSize: const Size(180, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // Handle scan button press
                    },
                    child: Text(
                      'Save',
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
