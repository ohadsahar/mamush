import 'package:momrecipes/model/ingrediants/ingrediants.response.dart';

enum EIngredientEvents {
  getIngredients,
  createIngredient,
  resetIngredientsSearch
}

class IngrediantEvents {
  late EIngredientEvents eventType;
  late List<Ingredients> ingredients;
  late List<Ingredients> ingredientsToSave;
  late Ingredients ingredient;
  late String name;

  IngrediantEvents.getIngredients(String name) {
    this.name = name;
    this.eventType = EIngredientEvents.getIngredients;
  }

  IngrediantEvents.createIngredient(
      String name, List<Ingredients> ingredients) {
    this.name = name;
    this.ingredientsToSave = ingredients;
    this.eventType = EIngredientEvents.createIngredient;
  }

  IngrediantEvents.resetIngredientsSearch() {
    this.eventType = EIngredientEvents.resetIngredientsSearch;
  }
}
