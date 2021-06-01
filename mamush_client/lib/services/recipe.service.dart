import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:momrecipes/model/recipe/create_recipe.dto.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/services/storage.service.dart';
import 'package:momrecipes/model/recipe/recipe_filter.dto.dart';

@lazySingleton
class RecipeService {
  final Dio dio;
  final StorageService storageService;
  RecipeService({
    required this.dio,
    required this.storageService,
  });

  Future<List<Recipe>> getRecipes(String id) async {
    final uri = '/recipe/category/$id';
    final response = await dio.get(uri);
    final recipesResponse = RecipeResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    return recipesResponse.data;
  }

  Future<Recipe> getCurrentRecipe(String id) async {
    final uri = '/recipe/$id';
    final response = await dio.get(uri);
    final recipesResponse = Recipe.fromJson(
      response.data['data'] as Map<String, dynamic>,
    );
    return recipesResponse;
  }

  Future<List<Recipe>> getRecipeByFilter(
      RecipeFilterDTO recipeFilterDTO) async {
    final uri = '/recipe/search';
    final response = await dio.post(
      uri,
      data: recipeFilterDTO.toJson(),
    );
    final recipesResponse = RecipeResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    return recipesResponse.data;
  }

  Future<bool> createRecipe(CreateRecipeDTO createRecipeDTO) async {
    try {
      final String uri = '/recipe';
      final formData = await createRecipeDTO.toFormData();
      final response = await dio.post(uri, data: formData);
      if (response.data != null) {
        return true;
      }
      return false;
    } catch (e) {
      throw new Error();
    }
  }

  Future<bool> deleteRecipe(String id) async {
    try {
      final String uri = '/recipe/$id';
      final response = await dio.delete(uri);
      if (response.data != null) {
        return true;
      }
      return false;
    } catch (e) {
      throw new Error();
    }
  }
}
