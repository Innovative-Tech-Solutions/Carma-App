import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 243, 148, 30),
          title: Text(
            'My Schedule',
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
          leading: Image.asset(
            'assets/images/backbutton.png',
            color: Colors.white,
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Selector Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () {},
                    ),
                    Text(
                      'January',
                      style: GoogleFonts.openSans(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios,
                          color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Date Selection Circles
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DateCircle(day: '12', weekDay: 'Wed', isSelected: true),
                    DateCircle(day: '13', weekDay: 'Thur'),
                    DateCircle(day: '14', weekDay: 'Fri'),
                    DateCircle(day: '15', weekDay: 'Sat'),
                  ],
                ),
              ),
              // Schedule Section Title
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Today',
                  style: GoogleFonts.openSans(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
              // Schedule List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    ScheduleCard(
                      time: '9 AM',
                      color: Colors.orange[100]!,
                      avatarImage: 'assets/images/user.png',
                      name: 'Kim Tasha',
                      description:
                          'Benz GLE\nAjah Lekki\nFailing master cylinder\nWorn brakes pads',
                    ),
                    ScheduleCard(
                      time: '11 AM',
                      color: Colors.grey[200]!,
                      avatarImage: 'assets/images/user.png',
                      name: 'Kim Tasha',
                      description:
                          'Benz GLE\nAjah Lekki\nFailing master cylinder\nWorn brakes pads',
                    ),
                    ScheduleCard(
                      time: '1 PM',
                      color: Colors.orange[100]!,
                      avatarImage: 'assets/images/user.png',
                      name: 'Kim Tasha',
                      description:
                          'Benz GLE\nAjah Lekki\nFailing master cylinder\nWorn brakes pads',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateCircle extends StatelessWidget {
  final String day;
  final String weekDay;
  final bool isSelected;

  const DateCircle({
    Key? key,
    required this.day,
    required this.weekDay,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 121,
          width: 79,
          decoration: BoxDecoration(
              color: isSelected ? Colors.orange : Colors.grey[200],
              borderRadius: BorderRadius.circular(40)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: GoogleFonts.openSans(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              Text(
                weekDay,
                style: GoogleFonts.openSans(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String time;
  final Color color;
  final String avatarImage;
  final String name;
  final String description;

  const ScheduleCard({
    Key? key,
    required this.time,
    required this.color,
    required this.avatarImage,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  time,
                  style: GoogleFonts.openSans(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(avatarImage),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: GoogleFonts.inder(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      description,
                                      style: GoogleFonts.inder(
                                          color: Colors.black54, height: 1.4),
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
