import 'package:flutter/material.dart';
import 'package:momrecipes/utils/dimensions.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final VoidCallback onSubmit;
  final String text;
  const AppButton({
    this.width,
    this.height,
    this.color,
    required this.onSubmit,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSubmit,
      child: Container(
        alignment: Alignment.center,
        width: Dimensions.getScreenFractionWidth(
          context,
          0.26,
        ),
        height: Dimensions.getScreenFractionHeight(
          context,
          0.06,
        ),
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              const Color(0xff00B460),
              const Color(0xff00D38C),
            ],
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.md,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.xxl,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
