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
        const SizedBox(
          height: Dimensions.sxl,
        ),
        Text(
          strings.splashScreenDescription,
          style: TextStyle(
            color: Colors.black,
            fontSize: 34,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
