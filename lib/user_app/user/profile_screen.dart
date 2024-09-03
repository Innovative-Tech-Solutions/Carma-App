import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/backbutton.png'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      color: Color.fromARGB(255, 243, 148, 30),
                      size: 30,
                    ),
                  )
                ],
              ),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/car1.png', // Replace with actual image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 20,
                          color: Color.fromARGB(255, 243, 148, 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildInfoItem(
                          'assets/images/profileicon.png', 'Davy Dovy'),
                      const SizedBox(height: 20),
                      _buildInfoItem(
                          'assets/images/mail.png', 'Davydovy@gmail.com'),
                      const Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 243, 148, 30),
                      ),
                      _buildInfoItem(
                          'assets/images/loca.png', 'sambisa forest, Borno.'),
                      const SizedBox(height: 20),
                      _buildInfoItem(
                          'assets/images/phoneicon.png', '+247 419 360 911'),
                      const Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 243, 148, 30),
                      ),
                      _buildListItem('assets/images/web.png', 'History'),
                      const SizedBox(height: 20),
                      _buildListItem('assets/images/star.png', 'Rate'),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Want to become a mechanic?',
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'visit our website',
                          style: GoogleFonts.inter(
                              color: Colors.black, fontSize: 13),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Image.asset('assets/images/logout.png'),
                          const SizedBox(width: 10),
                          Text(
                            'Log out',
                            style: GoogleFonts.inder(
                                color: const Color.fromARGB(255, 219, 61, 61),
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String image, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 16),
          Text(
            text,
            style: GoogleFonts.inder(
              fontSize: 20,
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String image, String text) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(
        text,
        style: GoogleFonts.inder(
          fontSize: 20,
          color: const Color.fromRGBO(0, 0, 0, 0.5),
        ),
      ),
    );
  }
}
