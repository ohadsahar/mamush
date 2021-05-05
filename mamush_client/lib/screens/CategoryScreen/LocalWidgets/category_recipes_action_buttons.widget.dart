import 'package:flutter/material.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class CategoryRecipesActionButtons extends StatelessWidget {
  final VoidCallback goBack;

  const CategoryRecipesActionButtons({
    required this.goBack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
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
            ],
          ),
        ],
      ),
    );
  }
}
