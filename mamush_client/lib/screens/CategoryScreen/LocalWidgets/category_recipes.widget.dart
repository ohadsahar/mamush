import 'package:flutter/material.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class CategoryRecipesWidget extends StatelessWidget {
  final List<dynamic> recipes;
  final Function onPress;
  const CategoryRecipesWidget({
    required this.recipes,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    final double cardBorder = Dimensions.xs;
    final S strings = S.of(context);
    return Container(
      child: recipes.length > 0
          ? GridView.count(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.md,
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              children: <Widget>[
                for (var recipe in recipes)
                  InkWell(
                    onTap: () => onPress(
                      recipe,
                    ),
                    child: Hero(
                      tag: recipe.id,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            cardBorder,
                          ),
                        ),
                        color: Colors.white,
                        elevation: 5,
                        child: Column(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(cardBorder),
                                child: recipe.recipePicture != null
                                    ? FadeInImage.assetNetwork(
                                        placeholder: Assets.images.loading.path,
                                        image: recipe.recipePicture.filePath,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      )
                                    : Image.asset(
                                        Assets.images.emptyStateFood.path,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                Dimensions.sm,
                              ),
                              child: Text(
                                recipe.recipeName,
                                style: appTheme.textTheme.headline4,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : Text(
              strings.categoryNoRecipes,
              style: appTheme.textTheme.headline3,
            ),
    );
  }
}
