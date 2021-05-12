import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:momrecipes/model/ingrediants/ingrediants.response.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';

@lazySingleton
class IngrediantService {
  Dio dio;

  IngrediantService({
    required this.dio,
  });

  Future<List<Ingredients>?> getIngrediants(String name) async {
    try {
      final uri = '/ingredients/$name';
      final response = await dio.get(uri);
      final ingredientsResponse = IngrediantResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
      return ingredientsResponse.data;
    } catch (e) {
      print(e);
    }
  }

  Future<Ingredient> createIngredient(String name) async {
    try {
      final uri = '/ingredients';
      final response = await dio.post(uri, data: {'ingredientName': name});
      final ingredientsResponse = Ingredient.fromJson(
        response.data['data'] as Map<String, dynamic>,
      );
      return ingredientsResponse;
    } catch (e) {
      throw new Error();
      print(e);
    }
  }
}
