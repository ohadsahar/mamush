import 'package:flutter/material.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/utils/dimensions.dart';

class AppScreen extends StatelessWidget {
  final Widget child;
  final bool? withImage;

  const AppScreen({
    required this.child,
    this.withImage = true,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: withImage == true
            ? Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      Assets.images.splashBackground.path,
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(
                        0.5,
                      ),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: child,
              )
            : Container(
                child: child,
              ),
      ),
    );
  }
}
