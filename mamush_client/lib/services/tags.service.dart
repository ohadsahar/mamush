import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/model/tags/tags.response.dart';

@lazySingleton
class TagsService {
  Dio dio;

  TagsService({
    required this.dio,
  });

  Future<List<Tags>> getTags(String id) async {
    final uri = '/tags/$id';
    final response = await dio.get(uri);
    final recipesResponse = TagsResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    return recipesResponse.data;
  }
}
