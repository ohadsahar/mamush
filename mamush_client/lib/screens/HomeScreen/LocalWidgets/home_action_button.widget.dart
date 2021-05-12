import 'package:flutter/material.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class HomeActionButton extends StatelessWidget {
  final IconData iconName;
  final VoidCallback onPress;

  const HomeActionButton({required this.iconName, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color(0xff00B460),
            const Color(0xff00D38C),
          ],
        ),
      ),
      width: 64,
      height: 64,
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          iconName,
          color: Colors.white,
          size: 40,
        ),
        onPressed: onPress,
      ),
    );
  }
}
