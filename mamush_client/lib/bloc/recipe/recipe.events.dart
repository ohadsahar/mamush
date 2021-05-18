import 'package:momrecipes/model/recipe/create_recipe.dto.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/model/recipe/recipe_filter.dto.dart';

enum ERecipeEvents { getRecipes, filterRecipe, setCurrentRecipe, createRecipe }

class RecipeEvents {
  late ERecipeEvents eventType;
  late RecipeFilterDTO recipeFilterDTO;
  late CreateRecipeDTO createRecipeDTO;
  late Recipe recipe;
  late List<Recipe> recipes;
  late String id;

  RecipeEvents.getRecipes(String id) {
    this.id = id;
    this.eventType = ERecipeEvents.getRecipes;
  }

  RecipeEvents.filterRecipes(RecipeFilterDTO recipeFilterDTO) {
    this.recipeFilterDTO = recipeFilterDTO;
    this.eventType = ERecipeEvents.filterRecipe;
  }

  RecipeEvents.setCurrentRecipe(Recipe recipe, List<Recipe> recipes) {
    this.recipe = recipe;
    this.recipes = recipes;
    this.eventType = ERecipeEvents.setCurrentRecipe;
  }
  RecipeEvents.createRecipe(CreateRecipeDTO createRecipeDTO) {
    this.createRecipeDTO = createRecipeDTO;
    this.eventType = ERecipeEvents.createRecipe;
  }
}
