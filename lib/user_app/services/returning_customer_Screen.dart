import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReturningCustomerScreen extends StatefulWidget {
  const ReturningCustomerScreen({super.key});

  @override
  _ReturningCustomerScreenState createState() =>
      _ReturningCustomerScreenState();
}

class _ReturningCustomerScreenState extends State<ReturningCustomerScreen> {
  String? selectedService;
  List<String> services = [
    'Tire service',
    'Battery replacement',
    'Brake repair',
    'Oil change',
    'Engine fine tune'
  ];

  bool showDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/backbutton.png',
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showDropdown = !showDropdown;
                    });
                  },
                  child: Card(
                    elevation: 4,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 217, 217, 217),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedService ??
                                'What would you like to get done',
                            style: GoogleFonts.inder(),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                if (showDropdown)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Services',
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            Column(
                              children: services.map((service) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            service,
                                            style: GoogleFonts.inter(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Radio<String>(
                                          value: service,
                                          groupValue: selectedService,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedService = value;
                                              showDropdown = false;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 20),
                Text(
                  'Are you wanting the brakes done on your Benz?',
                  style: GoogleFonts.inder(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color.fromARGB(255, 243, 148, 30),
                      ),
                      child: const Center(
                        child: Text('Yes'),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Something new?',
                  style: GoogleFonts.inder(
                    color: const Color.fromARGB(255, 243, 148, 30),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Year',
                              style: GoogleFonts.openSans(),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Make',
                              style: GoogleFonts.openSans(),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Model',
                              style: GoogleFonts.openSans(),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      elevation: 4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 217, 217, 217),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Style',
                              style: GoogleFonts.openSans(),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: const Color.fromARGB(255, 0, 0, 0)
                                  .withOpacity(0.4),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Center(
                  child: Container(
                    height: 65,
                    width: 291,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 148, 30),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: GoogleFonts.inder(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Add to your garage?',
                      style: GoogleFonts.inder(
                        fontSize: 17,
                        color: const Color.fromARGB(255, 243, 148, 30),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
