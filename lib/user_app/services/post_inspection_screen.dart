import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostInspectionScreen extends StatefulWidget {
  const PostInspectionScreen({super.key});

  @override
  State<PostInspectionScreen> createState() => _PostInspectionScreenState();
}

class _PostInspectionScreenState extends State<PostInspectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF9800),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Service Provided',
                    style: GoogleFonts.inder(
                      fontSize: 25,
                      color: const Color(0xFFFF9800),
                    ),
                  ),
                  Text(
                    'X',
                    style: GoogleFonts.inder(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Benz GLE',
                          style: GoogleFonts.inder(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Ajah Lekki',
                          style: GoogleFonts.inder(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Failing master cylinder\nWorn brake pads',
                          style: GoogleFonts.inder(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Babalola',
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '3.45',
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pictures Taken',
                    style: GoogleFonts.inder(
                      fontSize: 20,
                      color: const Color(0xFFFF9800),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_forward)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/tire.png',
                    height: 100,
                    width: 100,
                  ),
                  Image.asset(
                    'assets/images/brake.png',
                    height: 100,
                    width: 100,
                  ),
                  Image.asset(
                    'assets/images/headlight.png',
                    height: 100,
                    width: 100,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Did you enjoy our service?',
                style: GoogleFonts.inder(
                  fontSize: 25,
                  color: const Color(0xFFFF9800),
                ),
              ),
              const SizedBox(height: 10),
              buildRatingRow('Cleanliness', 4),
              buildRatingRow('Timeliness', 3),
              buildRatingRow('Professionalism', 4),
              buildRatingRow('Communication', 2),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Rate your experience',
                      style: GoogleFonts.inder(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 30,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Add a Comment',
                  labelStyle: GoogleFonts.inder(
                    color: Colors.black,
                  ),
                  suffixIcon: const Icon(Icons.edit),
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Add a tip?',
                style: GoogleFonts.inder(
                  fontSize: 20,
                  color: const Color(0xFFFF9800),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your charge was \$25.8',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTipButton('\$1'),
                  buildTipButton('\$2'),
                  buildTipButton('\$3'),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter custom amount',
                  labelStyle: GoogleFonts.openSans(
                    color: Colors.black,
                  ),
                  suffixIcon: const Icon(Icons.edit),
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF9800),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(200, 65),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRatingRow(String label, int rating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inder(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: List.generate(5, (index) {
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    '${index + 1}',
                    style: GoogleFonts.inder(
                      fontSize: 15,
                      color:
                          index == (rating - 1) ? Colors.orange : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget buildTipButton(String amount) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size(60, 40),
      ),
      child: Text(
        amount,
        style: GoogleFonts.openSans(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
