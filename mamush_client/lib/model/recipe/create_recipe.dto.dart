import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';

part 'create_recipe.dto.g.dart';

@JsonSerializable()
class CreateRecipeDTO {
  int? id;
  String recipeName;
  String? recipePicture;
  List<RecipeIngredients> recipeIngredients;
  List<Instructions> instructions;
  String category;

  CreateRecipeDTO({
    required this.id,
    required this.recipeName,
    required this.recipePicture,
    required this.recipeIngredients,
    required this.instructions,
    required this.category,
  });

  Map<String, dynamic> toJson() => _$CreateRecipeDTOToJson(this);

  factory CreateRecipeDTO.fromJson(Map<String, dynamic> json) =>
      _$CreateRecipeDTOFromJson(json);

  Future<FormData> toFormData() async {
    final map = toJson();
    if (recipePicture != null && recipePicture != '') {
      map['recipePicture'] = await MultipartFile.fromFile(recipePicture!);
    }
    map['recipeIngredients'] =
        jsonEncode(map['recipeIngredients'].map((e) => e.toJson()).toList());
    map['instructions'] =
        jsonEncode(map['instructions'].map((e) => e.toJson()).toList());
    return FormData.fromMap(map);
  }
}
