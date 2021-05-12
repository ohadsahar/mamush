import 'package:flutter/material.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class RecipeAppBarWidget extends StatelessWidget {
  final VoidCallback goBack;
  final String recipeName;

  const RecipeAppBarWidget({
    required this.goBack,
    required this.recipeName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: Dimensions.sxl,
                color: Colors.black,
              ),
              onPressed: goBack,
            ),
            Text(
              recipeName,
              style: appTheme.textTheme.headline2,
            ),
          ],
        ),
      ],
    );
  }
}
