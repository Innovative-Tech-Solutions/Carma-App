import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyGarageScreen extends StatefulWidget {
  const MyGarageScreen({super.key});

  @override
  State<MyGarageScreen> createState() => _MyGarageScreenState();
}

class _MyGarageScreenState extends State<MyGarageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/backbutton.png',
              ),
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
                      Icons.add,
                      size: 50,
                    ),
                    onPressed: () {
                      // Handle add button press
                    },
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {
                      // Handle delete button press
                    },
                  ),
                ],
              ),

              // Image carousel
              SizedBox(
                height: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      imageTile('assets/images/garage2.png'),
                      const SizedBox(width: 10),
                      imageTile('assets/images/garage1.png'),
                      const SizedBox(width: 10),
                      imageTile('assets/images/garage3.png'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Description section
              sectionHeader('Description'),
              const SizedBox(height: 10),
              carDescription(),
              const SizedBox(height: 10),

              // History section
              sectionHeader('History'),
              const SizedBox(height: 10),
              historyInfo(),
              const SizedBox(height: 20),

              // Scan Button
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
                    'Scan',
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
    );
  }

  Widget imageTile(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        imagePath,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget sectionHeader(String title) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/brakeslogo.svg'),
        const SizedBox(width: 10),
        Text(
          title,
          style: GoogleFonts.inder(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        if (title == 'Description')
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              side: const BorderSide(color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              // Handle schedule a service press
            },
            child: const Text(
              'Schedule a service',
              style: TextStyle(color: Colors.black),
            ),
          ),
      ],
    );
  }

  Widget carDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textInfoRow('Model:', 'Civic'),
        textInfoRow('Make:', 'Honda'),
        textInfoRow('Colour:', 'Red'),
        textInfoRow('Year:', '2018'),
        textInfoRow('Mileage:', '35,000 miles'),
        textInfoRow('Plate Number:', 'ABC1234'),
        textInfoRow('Address:', '1234 Elm Street, Springfield IL'),
      ],
    );
  }

  Widget historyInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textInfoRow('Booking ID:', '12345'),
          textInfoRow('Customer Name:', 'John Doe'),
          textInfoRow('Vehicle Model:', 'Toyota Camry 2018'),
          textInfoRow('License Plate:', 'ABC-1234'),
          textInfoRow('Service Requested:', 'Full Service and Oil Change'),
          textInfoRow('Mechanic Assigned:', 'Mike Johnson'),
          textInfoRow('Booking Date:', 'June 1, 2024'),
          textInfoRow('Service Date:', 'June 3, 2024'),
          textInfoRow(
            'Service Location:',
            '123 Main Street, Springfield',
          ),
          textInfoRow('Contact Information:', '+1 555-123-4567'),
        ],
      ),
    );
  }

  Widget textInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title ',
            style: GoogleFonts.inder(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inder(
                fontSize: 14,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
