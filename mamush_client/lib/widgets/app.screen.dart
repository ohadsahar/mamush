import 'package:flutter/material.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/utils/dimensions.dart';

class AppScreen extends StatelessWidget {
  final Widget child;

  const AppScreen({
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: Dimensions.getScreenFractionWidth(context, 1),
          height: Dimensions.getScreenFractionHeight(context, 1),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.images.splashBackground.path,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(
                  0.7,
                ),
                BlendMode.softLight,
              ),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
