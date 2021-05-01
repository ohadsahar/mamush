// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_filter.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeFilterDTO _$RecipeFilterDTOFromJson(Map<String, dynamic> json) {
  return RecipeFilterDTO(
    name: json['name'] as String?,
    tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    ingredients: (json['ingredients'] as List<dynamic>?)
        ?.map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
        .toList(),
    categoryID: json['categoryID'] as int?,
  );
}

Map<String, dynamic> _$RecipeFilterDTOToJson(RecipeFilterDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tags': instance.tags,
      'ingredients': instance.ingredients,
      'categoryID': instance.categoryID,
    };
