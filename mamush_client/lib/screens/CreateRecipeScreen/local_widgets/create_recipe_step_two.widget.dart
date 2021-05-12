import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.bloc.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.events.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.state.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/ingrediants/ingrediants.response.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app_button.widget.dart';
import 'package:momrecipes/widgets/custom_input.widget.dart';
import 'package:momrecipes/widgets/loading.widget.dart';

class CreateRecipeStepTWoWidget extends StatefulWidget {
  final Function onSubmit;
  const CreateRecipeStepTWoWidget({
    required this.onSubmit,
  });
  @override
  _CreateRecipeStepTWoWidgetState createState() =>
      _CreateRecipeStepTWoWidgetState();
}

class _CreateRecipeStepTWoWidgetState extends State<CreateRecipeStepTWoWidget> {
  late File _image = File('');
  final picker = ImagePicker();
  late IngrediantBloc ingrediantBloc;
  final List<Ingredients> indgredients = [];
  List<RecipeIngredients> indgredientsToSave = [];
  late String searchValue;

  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: Dimensions.sxl * 3,
          ),
          const SizedBox(
            height: Dimensions.sxl * 1.5,
          ),
          FractionallySizedBox(
            widthFactor: 0.7,
            child: CustomInputWidget(
              onChange: (value) => {_getChanges(value)},
              change: true,
              // onChange: _onChanged,
              initialValue: '',
              validators: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.minLength(
                    context,
                    1,
                    errorText: strings.completeProfileScreenError,
                  ),
                ],
              ),
              hint: strings.createRecipeAddRecipeName,
              attribute: 'recipeName',
              type: TextInputType.text,
            ),
          ),
          BlocBuilder<IngrediantBloc, IngredientsState>(
            builder: (
              BuildContext context,
              IngredientsState state,
            ) {
              if (state is IngredientLoadedState) {
                return Column(
                  children: <Widget>[
                    const SizedBox(
                      height: Dimensions.sxl,
                    ),
                    for (var ingredient in state.ingredients)
                      InkWell(
                        onTap: () => _addIngredients(ingredient),
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
                                      color: AppColors.thirdColor,
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
                    if (state.ingredients.length <= 0)
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
                                color: AppColors.thirdColor,
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
                                          onSubmit: _createIngredient,
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
              } else {
                return LoadingWidget();
              }
            },
          ),
          //Table And Logic
          BlocConsumer<IngrediantBloc, IngredientsState>(
            listener: (context, IngredientsState state) {
              if (state is IngrediendAddedSucessfullyState) {
                final RecipeIngredients recipeIngredients =
                    new RecipeIngredients(
                  id: null,
                  type: 'GRAM',
                  amount: 1,
                  ingredient: state.createdIngredient,
                );
                indgredientsToSave.add(
                  recipeIngredients,
                );
                setState(() {
                  indgredientsToSave = indgredientsToSave;
                });
              }
            },
            builder: (context, state) {
              return SizedBox();
            },
          ),
          for (var ingredient in indgredientsToSave)
            Column(
              children: [
                Text(
                  ingredient.ingredient.ingredientName,
                ),
                Text(ingredient.amount.toString()),
                Text(ingredient.type),
              ],
            ),

          SizedBox(
            height: Dimensions.getScreenFractionHeight(
              context,
              0.2,
            ),
          ),
          //Change to fab later
          AppButton(
            onSubmit: _submitted,
            text: strings.createRecipeNextLevel,
          ),
        ],
      ),
    );
  }

  _submitted() {
    print(indgredientsToSave);
  }

  _getChanges(String value) {
    setState(() {
      searchValue = value;
    });
    ingrediantBloc = BlocProvider.of<IngrediantBloc>(context);
    ingrediantBloc.add(
      IngrediantEvents.getIngredients(value),
    );
  }

  _createIngredient() {
    ingrediantBloc = BlocProvider.of<IngrediantBloc>(context);
    ingrediantBloc.add(
      IngrediantEvents.createIngredient(
        searchValue,
        indgredients,
      ),
    );
  }

  _addIngredients(Ingredients ingredient) {
    final Ingredient existsIngredient = new Ingredient(
      id: ingredient.id,
      ingredientName: ingredient.ingredientName,
    );
    final RecipeIngredients recipeIngredients = new RecipeIngredients(
      id: null,
      type: 'GRAM',
      amount: 1,
      ingredient: existsIngredient,
    );
    indgredientsToSave.add(recipeIngredients);
    ingrediantBloc = BlocProvider.of<IngrediantBloc>(context);
    ingrediantBloc.add(IngrediantEvents.resetIngredientsSearch());
    setState(() {});
  }
}
