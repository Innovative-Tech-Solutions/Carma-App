import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MechanicHistoryScreen extends StatefulWidget {
  const MechanicHistoryScreen({super.key});

  @override
  State<MechanicHistoryScreen> createState() => _MechanicHistoryScreenState();
}

class _MechanicHistoryScreenState extends State<MechanicHistoryScreen> {
  String _selectedPeriod = 'Week';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
        title: const Text('History', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            // Handle close button press
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPeriodButton('Day'),
                _buildPeriodButton('Week'),
                _buildPeriodButton('Month'),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildBookingItem('Pending', 0.0),
                _buildBookingItem('Completed', 25.0),
                _buildBookingItem('Completed', 32.0),
                _buildBookingItem('Declined', null),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodButton(String label) {
    bool isSelected = _selectedPeriod == label;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.orange : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: isSelected ? Colors.orange : Colors.grey),
        ),
      ),
      onPressed: () => setState(() => _selectedPeriod = label),
      child: Text(label),
    );
  }

  Widget _buildBookingItem(String status, double? price) {
    Color statusColor;
    switch (status) {
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Completed':
        statusColor = Colors.green;
        break;
      case 'Declined':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Transform.translate(
              offset: const Offset(0, -45),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, size: 40, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kim Tasha',
                        style: GoogleFonts.inder(
                            fontWeight: FontWeight.w400, fontSize: 20),
                      ),
                      Container(
                        height: 39,
                        width: 110,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(status,
                              style: GoogleFonts.inder(color: statusColor)),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Benz GLE',
                    style: GoogleFonts.inder(
                        fontWeight: FontWeight.w200, fontSize: 15),
                  ),
                  Text(
                    'Ajah Lekki',
                    style: GoogleFonts.inder(
                        fontWeight: FontWeight.w200, fontSize: 15),
                  ),
                  Text(
                    'Failing master cylinder',
                    style: GoogleFonts.inder(
                        fontWeight: FontWeight.w200, fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Worn brakes pads',
                        style: GoogleFonts.inder(
                            fontWeight: FontWeight.w200, fontSize: 15),
                      ),
                      Text(
                        price != null ? '\$${price.toStringAsFixed(2)}' : 'N/A',
                        style: GoogleFonts.inder(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        5,
                        (index) => Icon(Icons.star,
                            size: 16,
                            color: index < 3 ? Colors.orange : Colors.grey)),
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
