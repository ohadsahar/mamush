import 'package:flutter/material.dart';
import 'package:momrecipes/utils/dimensions.dart';

class RecipeAppBarWidget extends StatelessWidget {
  final VoidCallback goBack;
  final String recipeName;
  final Color? color;

  const RecipeAppBarWidget({
    required this.goBack,
    required this.recipeName,
    this.color,
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
                color: color ?? Colors.white,
              ),
              onPressed: goBack,
            ),
            Text(
              recipeName,
              style: TextStyle(
                color: color ?? Colors.white,
                fontSize: Dimensions.sxl * 1.25,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
