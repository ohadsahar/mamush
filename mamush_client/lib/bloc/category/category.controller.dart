import 'package:momrecipes/model/category/category.response.dart';
import 'package:momrecipes/services/category.service.dart';
import 'package:momrecipes/setup/injection.dart';

abstract class CategoryRepo {
  Future<List<Category>> getCategories();
}

class CategoryController extends CategoryRepo {
  @override
  Future<List<Category>> getCategories() async {
    final CategoryService categoryService = getIt<CategoryService>();
    return await categoryService.getCategories();
  }
}
