import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScannerHistory extends StatefulWidget {
  const ScannerHistory({super.key});

  @override
  State<ScannerHistory> createState() => _ScannerHistoryState();
}

class _ScannerHistoryState extends State<ScannerHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('History'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Add your functionality here
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'February 2024',
            style: GoogleFonts.inder(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildHistoryCard(
            context,
            title: 'Fuel Guage',
            date: '04/01/24',
            image: 'assets/images/fuel.png',
            details: [
              _buildDetailItem(
                'Current fuel level: 3/4 tank',
                Colors.black,
              ),
              _buildDetailItem(
                'Low fuel warning: Fuel level low, please refuel',
                Colors.yellow,
              ),
            ],
            backgroundColor: Colors.white,
            imageColor: const Color.fromARGB(255, 255, 227, 128),
          ),
          const SizedBox(height: 16),
          Text(
            'January 2024',
            style: GoogleFonts.inder(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          _buildHistoryCard(
            context,
            title: 'Scan: 7 Problems Detected',
            date: '04/01/24',
            image: 'assets/images/pump.png',
            details: [
              _buildDetailItem('Engine Misfire', Colors.red),
              _buildDetailItem('Oxygen Sensor Malfunction', Colors.yellow),
              _buildDetailItem('Traction Control System', Colors.red),
              _buildDetailItem('Catalytic Converter Issues', Colors.yellow),
              _buildDetailItem('Faulty Mass Airflow Sensor', Colors.red),
              _buildDetailItem('Ignition System Faults', Colors.red),
              _buildDetailItem('Transmission Problems', Colors.yellow),
            ],
            backgroundColor: Colors.grey.shade300,
            imageColor: const Color.fromARGB(255, 255, 227, 128),
          ),
          const SizedBox(height: 16),
          _buildHistoryCard(
            context,
            title: 'Scan: 5 Problems Detected',
            date: '04/01/24',
            image: 'assets/images/pump.png',
            details: [
              _buildDetailItem('(EVAP) Leaks', Colors.red),
              _buildDetailItem('Electronic Throttle Control', Colors.yellow),
              _buildDetailItem('Malfunction Engine Coolant', Colors.red),
              _buildDetailItem('Temperature Sensor (ECT) Problems', Colors.red),
            ],
            backgroundColor: Colors.white,
            imageColor: const Color.fromARGB(255, 255, 2, 49),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(
    BuildContext context, {
    required String title,
    required String date,
    required String image,
    required List<Widget> details,
    required Color backgroundColor,
    required Color imageColor,
  }) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: details,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: imageColor,
                      child: Image.asset(image),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date,
                      style: GoogleFonts.inder(fontSize: 14),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String text, Color dotColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: dotColor,
            size: 12,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inder(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
