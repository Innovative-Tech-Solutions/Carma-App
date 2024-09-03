import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MechanicProfileScreen extends StatefulWidget {
  const MechanicProfileScreen({super.key});

  @override
  State<MechanicProfileScreen> createState() => _MechanicProfileScreenState();
}

class _MechanicProfileScreenState extends State<MechanicProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              color: const Color.fromARGB(255, 243, 148, 30),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/backbutton.png',
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Ahmed Adefemi',
                          style: GoogleFonts.openSans(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Menu
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.edit, color: Colors.black),
                    title: Text(
                      'Edit profile',
                      style: GoogleFonts.inder(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_balance_wallet_outlined,
                        color: Colors.black),
                    title: Text(
                      'Wallet',
                      style: GoogleFonts.inder(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.history, color: Colors.black),
                    title: Text(
                      'History',
                      style: GoogleFonts.inder(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.star_border, color: Colors.black),
                    title: Text(
                      'Rate',
                      style: GoogleFonts.inder(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.info_outline, color: Colors.black),
                    title: Text(
                      'About Us',
                      style: GoogleFonts.inder(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.headset_mic_outlined,
                        color: Colors.black),
                    title: Text(
                      'Help Center',
                      style: GoogleFonts.inder(fontSize: 20),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: Text(
                      'Log out',
                      style: GoogleFonts.inder(fontSize: 20, color: Colors.red),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            // Footer
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Want to become a mechanic?\nvisit our website',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle link tap
                    },
                    child: Text(
                      'http://jsvidsbncdjdbcldjbdckvjdbvckjvdjsk',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 243, 148, 30),
                      ),
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
