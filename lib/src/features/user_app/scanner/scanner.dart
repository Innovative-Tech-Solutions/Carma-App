import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Benz GLE',
          style: GoogleFonts.inder(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.settings, color: Colors.black),
                Icon(Icons.sync, color: Colors.black),
                Icon(Icons.notifications, color: Colors.black),
                Icon(Icons.home, color: Colors.black),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(76, 175, 80, 0.5),
                          ),
                          child:
                              SvgPicture.asset('assets/icons/buildicon.svg')),
                      const SizedBox(width: 8.0),
                      Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(254, 200, 1, 0.5),
                          ),
                          child:
                              SvgPicture.asset('assets/icons/buildicon.svg')),
                      const SizedBox(width: 8.0),
                      Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 255, 2, 49),
                          ),
                          child: SvgPicture.asset(
                            'assets/icons/buildicon.svg',
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.dstIn),
                          )),
                      const Spacer(),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/wifi.svg'),
                          const SizedBox(width: 5.0),
                          Text(
                            '4 Issues Found',
                            style: GoogleFonts.inder(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Center(
                    child: Text(
                      'MAJOR DRIVING IMPACT',
                      style: GoogleFonts.inter(
                        color: const Color.fromARGB(255, 255, 2, 49),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      'Could cause damage to your vehicle\nwith continued driving',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: const Color.fromRGBO(0, 0, 0, 0.7),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Diagnostic Report',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                const Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                DiagnosticItem(
                  title: 'Rear Propshaft Speed Sensor',
                  code: 'C0300-Engine Code',
                ),
                DiagnosticItem(
                  title: 'Front Headlight',
                  code: 'P0200-Engine Code',
                ),
                DiagnosticItem(
                  title: 'Injector Problem',
                  code: 'B0200-Engine Code',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
                child: Text(
                  'Book a service',
                  style: GoogleFonts.inder(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiagnosticItem extends StatelessWidget {
  final String title;
  final String code;

  const DiagnosticItem({required this.title, required this.code, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/reports.svg'),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inder(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 22.0,
                      ),
                    ),
                    Text(
                      code,
                      style: GoogleFonts.inder(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
          const Divider(
            color: Color.fromRGBO(0, 0, 0, 0.5),
          )
        ],
      ),
    );
  }
}
