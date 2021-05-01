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
    // final double width = 200;
    // final double height = 200;
    final S strings = S.of(context);
    return Expanded(
      child: recipes.length > 0
          ? GridView.count(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.md,
              ),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 24,
              children: <Widget>[
                for (var recipe in recipes)
                  InkWell(
                    onTap: () => onPress(
                      recipe,
                    ),
                    child: Column(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 16 / 13,
                          child: Hero(
                            tag: recipe.id,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Dimensions.sxl,
                              ),
                              child: recipe.recipePicture != null
                                  ? Image.network(
                                      recipe.recipePicture.filePath,
                                      fit: BoxFit.cover,
                                      // width: width,
                                      // height: height,
                                    )
                                  : Image.asset(
                                      Assets.images.noUser.path,
                                      fit: BoxFit.cover,
                                      // width: width,
                                      // height: height,
                                    ),
                            ),
                          ),
                        ),
                        Text(
                          recipe.recipeName,
                          style: appTheme.textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
              ],
            )
          : Text(
              strings.categoryNoRecipes,
              style: appTheme.textTheme.headline2,
            ),
    );
  }
}
