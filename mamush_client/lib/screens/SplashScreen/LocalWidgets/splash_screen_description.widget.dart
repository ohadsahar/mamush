import 'package:flutter/material.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/utils/dimensions.dart';

class SplashScreenDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              width: Dimensions.getScreenFractionWidth(
                context,
                0.7,
              ),
              child: Image.asset(
                Assets.images.logoImage.path,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
