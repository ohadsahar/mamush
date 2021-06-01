import 'package:flutter/material.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/screens/RecipeScreen/LocalWidgets/recipe_ingredients_item.widget.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class RecipeIngredientsWidget extends StatelessWidget {
  final Recipe recipe;
  const RecipeIngredientsWidget({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(
          Dimensions.sm,
        ),
      ),
      color: Colors.white,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(
          Dimensions.xl,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              strings.recipeScreen(
                recipe.recipeIngredients!.length,
              ),
              style: appTheme.textTheme.headline3,
            ),
            const SizedBox(
              height: Dimensions.xxl,
            ),
            for (var ingredient in recipe.recipeIngredients!)
              RecipeIngredientsItemWidget(
                ingredient: ingredient,
              ),
          ],
        ),
      ),
    );
  }
}
