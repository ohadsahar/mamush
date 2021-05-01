import 'package:equatable/equatable.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';

abstract class RecipeState extends Equatable {
  @override
  List<Object> get props => [];
  List<Recipe> get recipes => this.recipes;
  Recipe get recipe => this.recipe;
}

class RecipeInitState extends RecipeState {}

class RecipeLoadingState extends RecipeState {}

class RecipeLoadedState extends RecipeState {
  final List<Recipe> recipes;
  RecipeLoadedState({
    required this.recipes,
  });
}

class RecipeCurrentLoadedState extends RecipeState {
  final Recipe recipe;
  final List<Recipe> recipes;
  RecipeCurrentLoadedState({
    required this.recipe,
    required this.recipes,
  });
}
