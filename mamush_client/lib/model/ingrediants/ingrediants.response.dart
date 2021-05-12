import 'package:json_annotation/json_annotation.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';

part 'ingrediants.response.g.dart';

@JsonSerializable()
class IngrediantResponse {
  List<Ingredients>? data;
  bool success;

  IngrediantResponse({
    this.data,
    required this.success,
  });

  factory IngrediantResponse.fromJson(Map<String, dynamic> json) =>
      _$IngrediantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IngrediantResponseToJson(this);
}

@JsonSerializable()
class Ingredients {
  int id;
  String ingredientName;
  bool? isSelected;

  Ingredients({
    required this.id,
    required this.ingredientName,
    this.isSelected,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);

  onSelected(bool value) {
    this.isSelected = value;
  }
}
