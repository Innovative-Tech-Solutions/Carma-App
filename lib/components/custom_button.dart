import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  const CustomButton({super.key, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
