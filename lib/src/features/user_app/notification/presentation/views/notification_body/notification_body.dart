import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationBody extends StatefulWidget {
  const NotificationBody({super.key});

  @override
  State<NotificationBody> createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
        leading: Image.asset(
          'assets/images/backbutton.png',
          color: Colors.white,
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.openSans(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Reminder Notification',
              style: GoogleFonts.inder(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 228, 228),
                borderRadius: BorderRadius.circular(35.09),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Upcoming Mechanic Appointment on\n(Date & Time)',
                    style: GoogleFonts.inder(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Dear [Customer Name],',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'This is a friendly reminder that you have a scheduled mechanic appointment with us on [Service Date] at [Service Time].',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Below are the details of your booking:',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Booking ID: [Booking ID]',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Vehicle Model: [Vehicle Model]',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'License Plate: [License Plate]',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Service Location: [Service Location]',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Mechanic Assigned: [Mechanic Name]',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Please ensure that your vehicle is at the service location on time.',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'If you have any questions or need to reschedule, feel free to contact us at [Contact Information].',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Thank you for choosing our service!\nWe look forward to providing you with excellent service.',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Best regards,\n[Your Company Name]\n[Company Contact Information]\n[Website URL]',
                    style: GoogleFonts.inder(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Use GPS to track location?',
                    style: GoogleFonts.inder(
                        color: const Color.fromARGB(255, 243, 148, 30),
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
