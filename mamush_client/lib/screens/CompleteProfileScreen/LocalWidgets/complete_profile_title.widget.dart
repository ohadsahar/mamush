import 'package:flutter/material.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class CompleteProfileTitleWidget extends StatelessWidget {
  final String title;
  const CompleteProfileTitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const SizedBox(
        height: Dimensions.xxl,
      ),
      Text(
        title,
        style: appTheme.textTheme.headline2,
      ),
      const SizedBox(
        height: Dimensions.xxl,
      ),
    ]);
  }
}
