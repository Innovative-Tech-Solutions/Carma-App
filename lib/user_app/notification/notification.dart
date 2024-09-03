import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
        leading: Image.asset(
          'assets/images/backbutton.png',
          color: Colors.white,
        ),
        title: Column(
          children: [
            Text(
              'Notifications',
              style: GoogleFonts.openSans(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'You have 3 notification today',
              style: GoogleFonts.openSans(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Today',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            NotificationItem(
              avatar: 'assets/images/user.png',
              title: 'Request for service',
              rating: 5,
              timeAgo: '3h ago',
            ),
            NotificationItem(
              avatar: 'assets/images/user.png',
              title: 'Payment successful',
              subtitle: 'Transaction Confirmed',
              timeAgo: '8h ago',
            ),
            NotificationItem(
              avatar: 'assets/images/user.png',
              title: 'User account',
              subtitle: 'Edit information',
              timeAgo: '18h ago',
            ),
            SizedBox(height: 16.0),
            Text(
              'This Week',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            NotificationItem(
              avatar: 'assets/images/user.png',
              title: 'Taylor Jadson',
              rating: 4,
              subtitle: 'Request for Rating',
              timeAgo: '7 June',
            ),
            NotificationItem(
              avatar: 'assets/images/user.png',
              title: 'Faith Taiwo',
              rating: 3,
              subtitle: 'Request for Rating',
              timeAgo: '7 June',
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String avatar;
  final String title;
  final String? subtitle;
  final int? rating;
  final String timeAgo;

  const NotificationItem({
    required this.avatar,
    required this.title,
    this.subtitle,
    this.rating,
    required this.timeAgo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 105,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.5),
          color: const Color.fromARGB(255, 233, 228, 228),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(avatar),
              radius: 30.0,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (rating != null) ...[
                        for (int i = 0; i < rating!; i++)
                          const Icon(Icons.star,
                              color: Colors.yellow, size: 16),
                        for (int i = rating!; i < 5; i++)
                          const Icon(Icons.star, color: Colors.grey, size: 16),
                        const SizedBox(width: 8.0),
                      ],
                      Text(
                        title,
                        style: GoogleFonts.inder(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: const Color.fromARGB(255, 151, 151, 151)),
                      ),
                    ],
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: GoogleFonts.inder(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: const Color.fromARGB(255, 151, 151, 151)),
                    ),
                  Text(
                    timeAgo,
                    style: GoogleFonts.inder(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: const Color.fromARGB(255, 151, 151, 151)),
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
