import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScannerLiveDataScreen extends StatefulWidget {
  const ScannerLiveDataScreen({super.key});

  @override
  State<ScannerLiveDataScreen> createState() => _ScannerLiveDataScreenState();
}

class _ScannerLiveDataScreenState extends State<ScannerLiveDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Benz GLE'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            // Add your functionality here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Live Data',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildLiveDataCard(
                    title: 'Trip Mode',
                    description: '200 miles,\n25 MPG,\n4.5 hours',
                    imagePath: 'assets/images/tripmode.png',
                  ),
                  _buildLiveDataCard(
                    title: 'Fuel Guage',
                    description:
                        'Fuel level: 30%\nLow fuel warning:\nFuel level low, please refuel',
                    imagePath: 'assets/images/fuelgauge.png',
                  ),
                  _buildLiveDataCard(
                    title: 'Current Location',
                    description:
                        'Latitude: 40.7128° N,\nLongitude: 74.0060° W\n(New York City)',
                    imagePath: 'assets/images/navigation.png',
                  ),
                  _buildLiveDataCard(
                    title: 'Navigation',
                    description:
                        'Arriving at destination\non the right in 300 feet',
                    imagePath: 'assets/images/currentlocation.png',
                  ),
                  _buildLiveDataCard(
                    title: 'KM meter',
                    description:
                        'Total distance:\n10,000 kilometers\nDistance since last reset:\n90 kilometers',
                    imagePath: 'assets/images/Kmeter.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveDataCard({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Container(
      height: 180,
      width: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
