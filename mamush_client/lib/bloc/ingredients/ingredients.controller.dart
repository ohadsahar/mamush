import 'package:momrecipes/model/ingrediants/ingrediants.response.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/services/ingrediants.service.dart';
import 'package:momrecipes/setup/injection.dart';

abstract class IngredientRepo {
  Future<List<Ingredients>?> getIngrediants(String name);
  Future<Ingredient> createIngredient(String name);
}

class IngrediantController extends IngredientRepo {
  @override
  Future<List<Ingredients>?> getIngrediants(String name) async {
    final IngrediantService ingrediantService = getIt<IngrediantService>();
    return await ingrediantService.getIngrediants(name);
  }

  @override
  Future<Ingredient> createIngredient(String name) async {
    final IngrediantService ingrediantService = getIt<IngrediantService>();
    return await ingrediantService.createIngredient(name);
  }
}
