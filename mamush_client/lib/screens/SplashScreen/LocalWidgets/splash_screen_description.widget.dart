import 'package:flutter/material.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/utils/dimensions.dart';

class SplashScreenDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double splashTitleSize = 130;
    final S strings = S.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          strings.splashScreenTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: splashTitleSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(
          children: [
            Container(
              width: Dimensions.getScreenFractionWidth(
                context,
                0.5,
              ),
              child: Image.asset(Assets.images.logoImage.path),
            ),
            const SizedBox(
              height: Dimensions.xl,
            ),
            Text(
              strings.splashScreenDescription,
              style: TextStyle(
                color: Colors.white,
                fontSize: Dimensions.sxl,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
