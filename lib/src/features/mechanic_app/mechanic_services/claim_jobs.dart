import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClaimJobsScreen extends StatefulWidget {
  const ClaimJobsScreen({super.key});

  @override
  State<ClaimJobsScreen> createState() => _ClaimJobsScreenState();
}

class _ClaimJobsScreenState extends State<ClaimJobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/backbutton.png'),
                  Image.asset('assets/images/notification_on.png'),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search for gigs',
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Categories',
                style: GoogleFonts.openSans(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CategoryButton(text: 'Location', isSelected: true),
                  CategoryButton(text: 'Date', isSelected: false),
                  CategoryButton(text: 'Vehicle', isSelected: false),
                ],
              ),
            ),

            // Tags
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '# Failing brakes',
                    style: GoogleFonts.openSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '# Loose shaft',
                    style: GoogleFonts.openSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '# Wornout brake pads',
                    style: GoogleFonts.openSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Unclaimed Jobs Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Unclaimed Jobs',
                style: GoogleFonts.openSans(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),

            // Job Cards List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  const JobCard(),
                  const JobCard(),
                  const JobCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryButton({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey[300] : Colors.green[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: GoogleFonts.openSans(
              color: isSelected ? Colors.black : Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/user.png'),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kim Tasha',
                                style: GoogleFonts.inder(
                                    fontWeight: FontWeight.w400, fontSize: 20),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Benz GLE\nAjah Lekki\n+224 901 8289 88\nFailing master cylinder\nWorn brakes pads\n12/12/2000\n\$25.00',
                                style: GoogleFonts.inder(
                                    color: Colors.black, height: 1.5),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Claim',
                            style: TextStyle(color: Colors.black54)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'View Details',
                        style: GoogleFonts.inder(
                            color: Colors.black, fontSize: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('assets/images/chat.png'),
                          Text(
                            ' Proceed to chat',
                            style: GoogleFonts.inder(
                                color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
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
