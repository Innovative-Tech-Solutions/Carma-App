import 'package:carma_app/src/features/components/custom_Textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MechanicWorkExperience extends StatefulWidget {
  const MechanicWorkExperience({super.key});

  @override
  State<MechanicWorkExperience> createState() => _MechanicWorkExperienceState();
}

class _MechanicWorkExperienceState extends State<MechanicWorkExperience> {
  String? selectedStartMonth;
  String? selectedStartYear;
  String? selectedFinishMonth;
  String? selectedFinishYear;
  bool workedOnElectric = false;
  bool workedOnHybrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User information',
          style: GoogleFonts.inter(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 148, 30),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Add Work Experience',
                      style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    Image.asset('assets/images/carmalogo.png'),
                  ],
                ),
                const SizedBox(height: 16),
                const CustomTextfield(
                  title: 'Specialty',
                  hintText: 'Ex; Bike/ABS - Car/Honda',
                ),
                const CustomTextfield(
                  title: 'Company',
                  hintText: 'Ex; Chris Motors Workshop',
                ),
                const CustomTextfield(
                  title: 'Location',
                  hintText: 'Ex; Abuja, Nigeria',
                ),
                const SizedBox(height: 16),
                const Text(
                  'Start Date*',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedStartMonth,
                        hint: const Text('Month'),
                        items: <String>[
                          'January',
                          'February',
                          'March',
                          'April',
                          'May',
                          'June',
                          'July',
                          'August',
                          'September',
                          'October',
                          'November',
                          'December'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedStartMonth = newValue;
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedStartYear,
                        hint: const Text('Year'),
                        items: List<String>.generate(
                                50,
                                (int index) =>
                                    (DateTime.now().year - index).toString())
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedStartYear = newValue;
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Finish Date*',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedFinishMonth,
                        hint: const Text('Month'),
                        items: <String>[
                          'January',
                          'February',
                          'March',
                          'April',
                          'May',
                          'June',
                          'July',
                          'August',
                          'September',
                          'October',
                          'November',
                          'December'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedFinishMonth = newValue;
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedFinishYear,
                        hint: const Text('Year'),
                        items: List<String>.generate(
                                50,
                                (int index) =>
                                    (DateTime.now().year - index).toString())
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedFinishYear = newValue;
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Have you worked on Electric or Hybrid?',
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: workedOnElectric,
                      onChanged: (bool? newValue) {
                        setState(() {
                          workedOnElectric = newValue!;
                        });
                      },
                    ),
                    Text(
                      'Yes',
                      style: GoogleFonts.inter(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Checkbox(
                      value: !workedOnElectric && !workedOnHybrid,
                      onChanged: (bool? newValue) {
                        setState(() {
                          workedOnElectric = false;
                          workedOnHybrid = false;
                        });
                      },
                    ),
                    Text(
                      'No',
                      style: GoogleFonts.inter(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Checkbox(
                      value: workedOnHybrid,
                      onChanged: (bool? newValue) {
                        setState(() {
                          workedOnHybrid = newValue!;
                        });
                      },
                    ),
                    Text(
                      'Both',
                      style: GoogleFonts.inter(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      // Handle continue button press
                    },
                    child: Text('Continue',
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
