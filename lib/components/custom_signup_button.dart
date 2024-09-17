import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSignupButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  const CustomSignupButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              height: 40,
              width: 264,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(icon),
                  const SizedBox(width: 15),
                  Text(
                    title,
                    style: GoogleFonts.inder(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
