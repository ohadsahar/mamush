import 'package:flutter/material.dart';
import 'package:momrecipes/utils/dimensions.dart';

class AppButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final VoidCallback onSubmit;
  final String text;
  const AppButton({
    required this.width,
    required this.height,
    required this.color,
    required this.onSubmit,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(
            width,
            height,
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          color,
        ),
      ),
      onPressed: onSubmit,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.xl,
        ),
      ),
    );
  }
}
