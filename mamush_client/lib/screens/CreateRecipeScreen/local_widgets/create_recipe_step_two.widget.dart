import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.bloc.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.events.dart';
import 'package:momrecipes/bloc/ingredients/ingredients.state.dart';
import 'package:momrecipes/constants/enums.dart';
import 'package:momrecipes/generated/l10n.dart';
import 'package:momrecipes/model/ingrediants/ingrediants.response.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/screens/CreateRecipeScreen/local_widgets/create_recipe_step_two_header.widget.dart';
import 'package:momrecipes/screens/CreateRecipeScreen/local_widgets/create_recipe_step_two_ingredient_search_view.widget.dart';
import 'package:momrecipes/theme/theme.dart';
import 'package:momrecipes/utils/dimensions.dart';
import 'package:momrecipes/widgets/app_button.widget.dart';
import 'package:momrecipes/widgets/custom_input.widget.dart';
import 'package:momrecipes/widgets/loading.widget.dart';

class CreateRecipeStepTWoWidget extends StatefulWidget {
  final Function onSubmit;
  final List<RecipeIngredients> indgredientsToSave;
  const CreateRecipeStepTWoWidget({
    required this.onSubmit,
    required this.indgredientsToSave,
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

  late String searchValue;
  final _formKey = GlobalKey<FormBuilderState>();
  final typeOptions = ['גרם', 'יחידה', 'כפית'];

  @override
  Widget build(BuildContext context) {
    final S strings = S.of(context);
    return Center(
      child: Column(
        children: [
          CreateRecipeStepTwoHeaderWidget(getChanges: _getChanges),
          BlocBuilder<IngrediantBloc, IngredientsState>(
            builder: (
              BuildContext context,
              IngredientsState state,
            ) {
              if (state is IngredientLoadedState) {
                return CreateRecipeStepTwoIngredientSearchViewWidget(
                    addIngredients: _addIngredients,
                    searchValue: searchValue,
                    ingredients: state.ingredients);
              } else {
                return SizedBox();
              }
            },
          ),
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
                widget.indgredientsToSave.add(
                  recipeIngredients,
                );
                setState(() {});
              }
            },
            builder: (context, state) {
              return SizedBox();
            },
          ),
          // for (var ingredient in indgredientsToSave)
          const SizedBox(
            height: Dimensions.sxl,
          ),
          Column(
            children: [
              Container(
                width: Dimensions.getScreenFractionWidth(
                  context,
                  0.92,
                ),
                height: 60,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      const Color(0xff00B460),
                      const Color(0xff00D38C),
                    ],
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Dimensions.getScreenFractionWidth(
                          context,
                          0.2,
                        ),
                        child: Text(
                          'שם המצרך',
                          style: appTheme.textTheme.headline3,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.getScreenFractionWidth(
                          context,
                          0.09,
                        ),
                        child: Text(
                          ' מידה',
                          style: appTheme.textTheme.headline3,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.getScreenFractionWidth(
                          context,
                          0.15,
                        ),
                        child: Text(
                          ' כמות',
                          style: appTheme.textTheme.headline3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: Dimensions.getScreenFractionHeight(
                  context,
                  0.38,
                ),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.md,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.indgredientsToSave.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 75,
                          margin: EdgeInsets.symmetric(
                            horizontal: Dimensions.md,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff0DC93133),
                                  blurRadius: 12,
                                  spreadRadius: 0,
                                  offset: Offset(
                                    0,
                                    7,
                                  ), // Shadow position
                                ),
                              ],
                            ),
                            child: FormBuilder(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: Dimensions.getScreenFractionWidth(
                                      context,
                                      0.3,
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                          ),
                                          onPressed: () =>
                                              _removeIngredient(index),
                                        ),
                                        Text(
                                          widget.indgredientsToSave[index]
                                              .ingredient.ingredientName,
                                          style: appTheme.textTheme.headline4,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.getScreenFractionWidth(
                                      context,
                                      0.2,
                                    ),
                                    child: FormBuilderDropdown(
                                      name: 'type',
                                      decoration: InputDecoration(
                                        labelText: convertToLanguage(
                                          widget.indgredientsToSave[index].type,
                                        ),
                                        labelStyle:
                                            appTheme.textTheme.headline4,
                                      ),
                                      onChanged: (value) => {
                                        setState(() {
                                          widget.indgredientsToSave[index]
                                                  .type =
                                              languageToEnum(value.toString());
                                        })
                                      },
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(context)
                                      ]),
                                      items: typeOptions
                                          .map(
                                            (type) => DropdownMenuItem(
                                              value: type,
                                              child: Text(
                                                '$type',
                                                style: appTheme
                                                    .textTheme.headline4,
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.getScreenFractionWidth(
                                      context,
                                      0.2,
                                    ),
                                    child: CustomInputWidget(
                                      onChange: (value) => {
                                        setState(() {
                                          widget.indgredientsToSave[index]
                                              .amount = int.parse(value);
                                        })
                                      },
                                      initialValue: widget
                                          .indgredientsToSave[index].amount
                                          .toString(),
                                      autoFocus: false,
                                      validators: FormBuilderValidators.compose(
                                        [],
                                      ),
                                      attribute: 'name',
                                      hint: strings
                                          .createRecipeStepTwoAmountInput,
                                      type: TextInputType.text,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _removeIngredient(int index) {
    widget.indgredientsToSave.removeAt(index);
    setState(() {});
  }

  _getChanges(String value) {
    setState(() {
      searchValue = value;
    });
    if (searchValue.length > 0) {
      ingrediantBloc = BlocProvider.of<IngrediantBloc>(context);
      ingrediantBloc.add(
        IngrediantEvents.getIngredients(value),
      );
    } else {
      ingrediantBloc.add(IngrediantEvents.resetIngredientsSearch());
    }
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
    widget.indgredientsToSave.add(recipeIngredients);
    ingrediantBloc = BlocProvider.of<IngrediantBloc>(context);
    ingrediantBloc.add(IngrediantEvents.resetIngredientsSearch());
    setState(() {});
  }

  convertToLanguage(String type) {
    final S strings = S.of(context);
    switch (type) {
      case Enums.unit:
        return strings.unit;
      case Enums.gram:
        return strings.gram;
      case Enums.spoon:
        return strings.spoon;
      default:
        return strings.emptyString;
    }
  }

  languageToEnum(String type) {
    final S strings = S.of(context);
    switch (type) {
      case 'יחידה':
        return Enums.unit;
      case 'גרם':
        return Enums.gram;
      case 'כפית':
        return Enums.spoon;
      default:
        return strings.emptyString;
    }
  }
}
