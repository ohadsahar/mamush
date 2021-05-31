import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/recipe/recipe.controller.dart';
import 'package:momrecipes/bloc/recipe/recipe.events.dart';
import 'package:momrecipes/bloc/recipe/recipe.state.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';

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
      case ERecipeEvents.createRecipe:
        yield RecipLoadingeCreateState();
        final response =
            await recipeController.createRecipe(event.createRecipeDTO);
        if (response) {
          final NavigationService navigationService =
              getIt<NavigationService>();
          navigationService.navigate(Routes.categoryScreen, {
            'id': event.categoryID,
            'name': event.categoryName,
          });
        }
        yield RecipLoadedeCreateState();
        break;

      case ERecipeEvents.deleteRecipe:
        yield RecipLoadingeCreateState();
        final response = await recipeController.deleteRecipe(event.id);
        if (response) {
          final NavigationService navigationService =
              getIt<NavigationService>();
          final index = event.recipes.indexWhere(
              (recipe) => recipe.id.toString() == event.id.toString());
          if (index >= 0) {
            event.recipes.removeAt(index);
          }
          yield RecipeLoadedState(
            recipes: event.recipes,
          );
          navigationService.navigate(Routes.categoryScreen, {
            'id': event.categoryID,
            'name': event.categoryName,
          });
        }

        break;
    }
  }
}
