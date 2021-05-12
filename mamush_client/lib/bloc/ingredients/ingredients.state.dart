import 'package:equatable/equatable.dart';
import 'package:momrecipes/model/ingrediants/ingrediants.response.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';

abstract class IngredientsState extends Equatable {
  @override
  List<Object> get props => [];
  List<Ingredients> get ingredients => this.ingredients;
  List<Ingredients> get ingredientsToSave => this.ingredientsToSave;
}

class IngredientInitState extends IngredientsState {}

class IngredientLoadingState extends IngredientsState {}

class IngredientLoadedState extends IngredientsState {
  final List<Ingredients> ingredients;
  IngredientLoadedState({
    required this.ingredients,
  });
}

class IngrediendAddedSucessfullyState extends IngredientsState {
  final Ingredient createdIngredient;

  IngrediendAddedSucessfullyState({
    required this.createdIngredient,
  });
}
