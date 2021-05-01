import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/services/tags.service.dart';
import 'package:momrecipes/setup/injection.dart';

abstract class TagsRepo {
  Future<List<Tags>> getTags(String id);
}

class TagsController extends TagsRepo {
  @override
  Future<List<Tags>> getTags(String id) async {
    final TagsService tagsService = getIt<TagsService>();
    return await tagsService.getTags(id);
  }
}
