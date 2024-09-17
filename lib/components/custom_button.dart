import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 45,
          width: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 148, 30),
            borderRadius: BorderRadius.circular(10),
          ),
          // ignore: prefer_const_constructors
          child: Center(
              child: Text(
            buttonTitle,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          )),
        ),
      ),
    );
  }
}
