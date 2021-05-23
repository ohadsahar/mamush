import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.bloc.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.events.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/ingrediants/ingrediants.response.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app_button.widget.dart';

class CreateRecipeStepTwoIngredientSearchViewWidget extends StatelessWidget {
  final List<Ingredients> ingredients;
  final Function addIngredients;
  final String searchValue;
  late IngrediantBloc ingrediantBloc;
  CreateRecipeStepTwoIngredientSearchViewWidget({
    required this.addIngredients,
    required this.ingredients,
    required this.searchValue,
  });
  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Column(
      children: <Widget>[
        const SizedBox(
          height: Dimensions.sxl,
        ),
        for (var ingredient in ingredients)
          InkWell(
            onTap: () => addIngredients(ingredient),
            child: Column(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.7,
                  child: Container(
                    padding: EdgeInsets.all(
                      Dimensions.xl,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: Dimensions.sm,
                          color: AppColors.inputColor,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                            Dimensions.sm,
                          ),
                          child: Text(
                            ingredient.ingredientName,
                            style: appTheme.textTheme.headline3,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (ingredients.length <= 0)
          FractionallySizedBox(
            widthFactor: 0.7,
            child: Container(
              padding: EdgeInsets.all(
                Dimensions.xl,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: Dimensions.sm,
                    color: AppColors.inputColor,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      Dimensions.sm,
                    ),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Text(
                            strings.createRecipeItemNotExists(
                              searchValue,
                            ),
                            style: appTheme.textTheme.headline4,
                            textAlign: TextAlign.right,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: Dimensions.sxl,
                            ),
                            child: AppButton(
                              onSubmit: () => _createIngredient(context),
                              text: strings.acceptButton,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          SizedBox(),
      ],
    );
  }

  _createIngredient(BuildContext context) {
    ingrediantBloc = BlocProvider.of<IngrediantBloc>(context);
    ingrediantBloc.add(
      IngrediantEvents.createIngredient(
        searchValue,
        ingredients,
      ),
    );
  }
}
