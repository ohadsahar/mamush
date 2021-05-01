import 'package:flutter/material.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class UserProfileActionCardWidget extends StatelessWidget {
  final String cardName;
  final VoidCallback onPress;
  final IconData icon;
  const UserProfileActionCardWidget({
    required this.cardName,
    required this.onPress,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.xl,
        ),
        width: Dimensions.getScreenFractionWidth(
          context,
          0.3,
        ),
        height: Dimensions.getScreenFractionHeight(
          context,
          0.2,
        ),
        decoration: BoxDecoration(
          color: AppColors.thirdColor,
          border: Border.all(
            color: AppColors.appPrimaryColor,
            width: Dimensions.sm,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.xl,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cardName,
              textAlign: TextAlign.center,
              style: appTheme.textTheme.headline6,
            ),
            const SizedBox(
              height: Dimensions.xl,
            ),
            Icon(
              icon,
              size: Dimensions.xxl * 2,
            ),
          ],
        ),
      ),
    );
  }
}
