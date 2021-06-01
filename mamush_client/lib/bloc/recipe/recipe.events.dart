import 'package:momrecipes/model/recipe/create_recipe.dto.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/model/recipe/recipe_filter.dto.dart';

enum ERecipeEvents {
  getRecipes,
  filterRecipe,
  setCurrentRecipe,
  createRecipe,
  deleteRecipe,
  getCurrentRecipe
}

class RecipeEvents {
  late ERecipeEvents eventType;
  late RecipeFilterDTO recipeFilterDTO;
  late CreateRecipeDTO createRecipeDTO;
  late Recipe recipe;
  late List<Recipe> recipes;
  late String id;
  late String categoryName;
  late String categoryID;

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

  RecipeEvents.getCurrentRecipe(String id, List<Recipe> recipes) {
    this.id = id;
    this.eventType = ERecipeEvents.getCurrentRecipe;
    this.recipes = recipes;
  }
  RecipeEvents.createRecipe(
    CreateRecipeDTO createRecipeDTO,
    String categoryName,
    String categoryID,
  ) {
    this.createRecipeDTO = createRecipeDTO;
    this.categoryName = categoryName;
    this.categoryID = categoryID;
    this.eventType = ERecipeEvents.createRecipe;
  }

  RecipeEvents.deleteRecipe(
    String id,
    List<Recipe> recipes,
    String categoryID,
    String categoryName,
  ) {
    this.categoryID = categoryID;
    this.categoryName = categoryName;
    this.id = id;
    this.eventType = ERecipeEvents.deleteRecipe;
    this.recipes = recipes;
  }
}
