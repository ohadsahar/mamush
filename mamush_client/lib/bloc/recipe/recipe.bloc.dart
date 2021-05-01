import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/recipe/recipe.controller.dart';
import 'package:momrecipes/bloc/recipe/recipe.events.dart';
import 'package:momrecipes/bloc/recipe/recipe.state.dart';

class RecipeBloc extends Bloc<RecipeEvents, RecipeState> {
  final RecipeController recipeController;

  RecipeBloc({required this.recipeController})
      : super(
          RecipeInitState(),
        );

  @override
  Stream<RecipeState> mapEventToState(RecipeEvents event) async* {
    switch (event.eventType) {
      case ERecipeEvents.getRecipes:
        try {
          yield RecipeLoadingState();
          final recipes = await recipeController.getRecipes(event.id);
          yield RecipeLoadedState(
            recipes: recipes,
          );
          break;
        } catch (e) {
          throw new Error();
        }
      case ERecipeEvents.filterRecipe:
        yield RecipeLoadingState();
        final recipes =
            await recipeController.getRecipeByFilter(event.recipeFilterDTO);
        yield RecipeLoadedState(
          recipes: recipes,
        );
        break;
      case ERecipeEvents.setCurrentRecipe:
        yield RecipeLoadingState();
        yield RecipeCurrentLoadedState(
          recipe: event.recipe,
          recipes: event.recipes,
        );
        break;
    }
  }
}
