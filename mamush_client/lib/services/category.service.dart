import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:momrecipes/model/category/category.response.dart';
import 'package:momrecipes/services/storage.service.dart';

@lazySingleton
class CategoryService {
  final Dio dio;
  final StorageService storageService;
  CategoryService({
    required this.dio,
    required this.storageService,
  });

  Future<List<Category>> getCategories() async {
    final uri = '/category';
    final response = await dio.get(uri);
    final categoryResponse = CategoryResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    return categoryResponse.data;
  }
}
