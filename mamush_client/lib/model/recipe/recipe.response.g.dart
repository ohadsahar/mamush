// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeResponse _$RecipeResponseFromJson(Map<String, dynamic> json) {
  return RecipeResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$RecipeResponseToJson(RecipeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    id: json['id'] as int,
    recipeName: json['recipeName'] as String,
    recipeIngredients: (json['recipeIngredients'] as List<dynamic>)
        .map((e) => RecipeIngredients.fromJson(e as Map<String, dynamic>))
        .toList(),
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => Tags.fromJson(e as Map<String, dynamic>))
        .toList(),
    instructions: (json['instructions'] as List<dynamic>)
        .map((e) => Instructions.fromJson(e as Map<String, dynamic>))
        .toList(),
    recipePicture: json['recipePicture'] == null
        ? null
        : AppFile.fromJson(json['recipePicture'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'recipeName': instance.recipeName,
      'recipeIngredients': instance.recipeIngredients,
      'tags': instance.tags,
      'instructions': instance.instructions,
      'recipePicture': instance.recipePicture,
    };

RecipeIngredients _$RecipeIngredientsFromJson(Map<String, dynamic> json) {
  return RecipeIngredients(
    id: json['id'] as int?,
    type: json['type'] as String,
    amount: json['amount'] as int,
    ingredient: Ingredient.fromJson(json['ingredient'] as Map<String, dynamic>),
    isSelected: json['isSelected'] as bool?,
  );
}

Map<String, dynamic> _$RecipeIngredientsToJson(RecipeIngredients instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'ingredient': instance.ingredient,
      'isSelected': instance.isSelected,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return Ingredient(
    id: json['id'] as int,
    ingredientName: json['ingredientName'] as String,
  );
}

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingredientName': instance.ingredientName,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(
    id: json['id'] as int,
    name: json['name'] as String,
    isSelected: json['isSelected'] as bool?,
  );
}

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSelected': instance.isSelected,
    };

Instructions _$InstructionsFromJson(Map<String, dynamic> json) {
  return Instructions(
    id: json['id'] as int,
    instructionsDescription: json['instructionsDescription'] as String,
    hasTimer: json['hasTimer'] as bool,
    timer: json['timer'] as int?,
    timerOn: json['timerOn'] as bool?,
  );
}

Map<String, dynamic> _$InstructionsToJson(Instructions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instructionsDescription': instance.instructionsDescription,
      'hasTimer': instance.hasTimer,
      'timer': instance.timer,
      'timerOn': instance.timerOn,
    };
