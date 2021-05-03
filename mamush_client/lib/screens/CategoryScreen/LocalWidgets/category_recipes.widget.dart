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
    final S strings = S.of(context);
    return Expanded(
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
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1,
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
                                    )
                                  : Image.asset(
                                      Assets.images.noUser.path,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: new LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                const Color(0xff000000),
                                const Color(0xff000000).withOpacity(0.1),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(Dimensions.sxl),
                              bottomRight: Radius.circular(Dimensions.sxl),
                            ),
                          ),
                          height: 100,
                          width: double.infinity,
                          child: Container(
                            margin: const EdgeInsets.only(
                              right: Dimensions.sxl,
                              top: Dimensions.sm,
                            ),
                            child: Text(
                              recipe.recipeName,
                              style: appTheme.textTheme.headline4,
                            ),
                          ),
                        ),
                      ],
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
