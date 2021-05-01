import 'package:json_annotation/json_annotation.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';

part 'recipe_filter.dto.g.dart';

@JsonSerializable()
class RecipeFilterDTO {
  String? name;
  List<String>? tags;
  List<Ingredients>? ingredients;
  int? categoryID;

  RecipeFilterDTO({
    this.name,
    this.tags,
    this.ingredients,
    this.categoryID,
  });

  factory RecipeFilterDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeFilterDTOFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeFilterDTOToJson(this);
}
