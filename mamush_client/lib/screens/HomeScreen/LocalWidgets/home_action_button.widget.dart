import 'package:flutter/material.dart';
import 'package:momrecipes/theme/theme.dart';

class HomeActionButton extends StatelessWidget {
  final IconData iconName;
  final VoidCallback onPress;

  const HomeActionButton({required this.iconName, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: AppColors.appPrimaryColor,
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
