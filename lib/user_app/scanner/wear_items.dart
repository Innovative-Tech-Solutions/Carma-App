import 'package:flutter/material.dart';

class WearItemsScreen extends StatefulWidget {
  const WearItemsScreen({super.key});

  @override
  State<WearItemsScreen> createState() => _WearItemsScreenState();
}

class _WearItemsScreenState extends State<WearItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text('Benz GLE'),
          centerTitle: true,
          leading: Image.asset(
            'assets/images/backbutton.png',
            color: Colors.white,
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Wear Items',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Below are important Vehicle\ncomponents which need to\nbe replaced over time',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildWearItemCard(
                    context,
                    'Battery',
                    'assets/images/brake.png',
                    'Caution',
                    const Color.fromARGB(255, 254, 200, 1),
                  ),
                  _buildWearItemCard(
                    context,
                    'Tire Tracks',
                    'assets/images/tire.png',
                    'Maintenance',
                    Colors.green,
                  ),
                  _buildWearItemCard(
                    context,
                    'Head Light',
                    'assets/images/headlight.png',
                    'Very Bad',
                    Colors.red,
                  ),
                  _buildWearItemCard(
                    context,
                    'Gear',
                    'assets/images/headlight.png',
                    'Caution',
                    const Color.fromARGB(255, 254, 200, 1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWearItemCard(BuildContext context, String title,
      String imagePath, String status, Color statusColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 160,
        height: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Image.asset(imagePath,
                height: 80, width: 80), // Replace with correct image paths
            const SizedBox(height: 8),

            Container(
              height: 40,
              width: 185,
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
