import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final void Function()? onTap;
  final Color? color;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.buttonTitle,
    this.onTap,
    this.color,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: isLoading ? null : onTap,
        child: Container(
          height: 45,
          width: 200,
          decoration: BoxDecoration(
            color: isLoading
                ? Colors.grey
                : color ?? const Color.fromARGB(255, 243, 148, 30),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: isLoading
                ? const Padding(
                    padding: EdgeInsets.all(5),
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    buttonTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
