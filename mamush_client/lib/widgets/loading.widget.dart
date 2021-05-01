import 'package:flutter/material.dart';
import 'package:momrecipes/theme/theme.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      widthFactor: 1,
      child: SizedBox(
        height: 300,
        width: 300,
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          backgroundColor: AppColors.appPrimaryColor,
        ),
      ),
    );
  }
}
