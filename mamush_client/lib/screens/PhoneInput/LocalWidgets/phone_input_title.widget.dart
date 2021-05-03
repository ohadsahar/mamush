import 'package:flutter/material.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class PhoneInputTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Column(
      children: <Widget>[
        Container(
          width: Dimensions.getScreenFractionWidth(
            context,
            0.45,
          ),
          child: Image.asset(
            Assets.images.logoImage.path,
          ),
        ),
        // Text(
        //   strings.splashScreenTitle,
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 130,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        const SizedBox(
          height: Dimensions.sxl,
        ),
        Text(
          strings.splashScreenDescription,
          style: appTheme.textTheme.headline4,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
