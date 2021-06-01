import 'package:flutter/material.dart';
import 'package:momrecipes/generated/assets.gen.dart';
import 'package:momrecipes/model/category/category.response.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class HomeCategoriesWidget extends StatelessWidget {
  final List<Category> categories;
  final Function onPress;
  const HomeCategoriesWidget({
    required this.categories,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    final double cardBorder = Dimensions.xs;
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.md,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        children: <Widget>[
          for (var category in categories)
            InkWell(
              onTap: () => onPress(category.id, category.name),
              child: Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cardBorder),
                    ),
                    color: Colors.white,
                    elevation: 5,
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 4 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(cardBorder),
                            child: FadeInImage.assetNetwork(
                              placeholder: Assets.images.loading.path,
                              image: Assets.images.logoImage.path,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(
                            Dimensions.sm,
                          ),
                          child: Text(
                            category.name,
                            style: appTheme.textTheme.headline4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
