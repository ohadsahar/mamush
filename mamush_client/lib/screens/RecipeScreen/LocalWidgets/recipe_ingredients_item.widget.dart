import 'package:flutter/material.dart';
import 'package:momrecipes/constants/enums.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/ingrediants/ingrediants.response.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';

class RecipeIngredientsItemWidget extends StatefulWidget {
  final RecipeIngredients ingredient;
  const RecipeIngredientsItemWidget({
    required this.ingredient,
  });

  @override
  _RecipeIngredientsItemWidgetState createState() =>
      _RecipeIngredientsItemWidgetState();
}

class _RecipeIngredientsItemWidgetState
    extends State<RecipeIngredientsItemWidget> {
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: Dimensions.md,
              ),
              child: Transform.scale(
                scale: 2,
                child: Checkbox(
                  activeColor: Color(
                    0xff00D38C,
                  ),
                  value: widget.ingredient.isSelected ?? false,
                  onChanged: (value) {
                    setState(
                      () {
                        widget.ingredient.isSelected = value;
                      },
                    );
                  },
                ),
              ),
            ),
            Text(
              '${widget.ingredient.ingredient.ingredientName} ',
              style: appTheme.textTheme.headline3,
            ),
            Text(
              strings.recipeAmount(
                widget.ingredient.amount,
                convertToLanguage(
                    widget.ingredient.type, widget.ingredient.amount),
              ),
              style: appTheme.textTheme.headline3,
            ),
          ],
        ),
      ],
    );
  }

  convertToLanguage(String type, String amount) {
    final S strings = S.of(context);
    var bigger = false;
    var a = double.tryParse(amount);
    if (a != null) {
      if (a > 1) {
        bigger = true;
      }
    }
    switch (type) {
      case Enums.unit:
        return bigger ? strings.units : strings.unit;
      case Enums.gram:
        return strings.gram;
      case Enums.spoon:
        return bigger ? strings.spoons : strings.spoon;
      case Enums.cup:
        return bigger ? strings.cups : strings.cup;
      case Enums.kg:
        return strings.kg;
      case Enums.ml:
        return strings.ml;
      case Enums.tableSpoon:
        return bigger ? strings.tableSpoons : strings.tableSpoon;
      default:
        return strings.emptyString;
    }
  }
}
