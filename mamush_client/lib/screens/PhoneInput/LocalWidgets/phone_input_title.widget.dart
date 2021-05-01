import 'package:flutter/material.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/theme/theme.dart';

class PhoneInputTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Column(
      children: <Widget>[
        Text(
          strings.splashScreenTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 130,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          strings.splashScreenDescription,
          style: appTheme.textTheme.headline2,
        ),
      ],
    );
  }
}
