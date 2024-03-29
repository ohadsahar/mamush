import 'package:momrecipes/model/recipe/create_recipe.dto.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/services/recipe.service.dart';
import 'package:momrecipes/setup/injection.dart';
import 'package:momrecipes/model/recipe/recipe_filter.dto.dart';

abstract class RecipeRepo {
  Future<List<Recipe>> getRecipes(String id);
  Future<List<Recipe>> getRecipeByFilter(RecipeFilterDTO recipeFilterDTO);
  Future<bool> createRecipe(CreateRecipeDTO createRecipeDTO);
  Future<bool> deleteRecipe(String id);
  Future<Recipe> getCurrentRecipe(String id);
}

class RecipeController extends RecipeRepo {
  @override
  Future<List<Recipe>> getRecipes(String id) async {
    final RecipeService recipeService = getIt<RecipeService>();
    return await recipeService.getRecipes(id);
  }

  @override
  Future<List<Recipe>> getRecipeByFilter(
      RecipeFilterDTO recipeFilterDTO) async {
    final RecipeService recipeService = getIt<RecipeService>();
    return await recipeService.getRecipeByFilter(recipeFilterDTO);
  }

  @override
  Future<Recipe> getCurrentRecipe(String id) async {
    final RecipeService recipeService = getIt<RecipeService>();
    return await recipeService.getCurrentRecipe(id);
  }

  @override
  Future<bool> createRecipe(CreateRecipeDTO createRecipeDTO) async {
    final RecipeService recipeService = getIt<RecipeService>();
    return await recipeService.createRecipe(createRecipeDTO);
  }

  @override
  Future<bool> deleteRecipe(String id) async {
    final RecipeService recipeService = getIt<RecipeService>();
    return await recipeService.deleteRecipe(id);
  }
}
