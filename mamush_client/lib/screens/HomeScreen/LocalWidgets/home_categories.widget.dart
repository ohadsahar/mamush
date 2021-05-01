import 'package:flutter/material.dart';
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
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.md,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 36,
        children: <Widget>[
          for (var category in categories)
            InkWell(
              onTap: () => onPress(category.id, category.name),
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32.0),
                      child: Image.network(
                        category.categoryPicture.filePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    category.name,
                    style: appTheme.textTheme.headline4,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
