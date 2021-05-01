import 'package:json_annotation/json_annotation.dart';
import 'package:momrecipes/model/user/user.response.dart';

part 'recipe.response.g.dart';

@JsonSerializable()
class RecipeResponse {
  List<Recipe> data;
  bool success;

  RecipeResponse({
    required this.data,
    required this.success,
  });

  factory RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeResponseToJson(this);
}

@JsonSerializable()
class Recipe {
  int id;
  String recipeName;
  List<Ingredients> ingredients;
  List<Tags>? tags;
  List<Instructions> instructions;
  AppFile? recipePicture;

  Recipe({
    required this.id,
    required this.recipeName,
    required this.ingredients,
    this.tags,
    required this.instructions,
    this.recipePicture,
  });
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class Ingredients {
  int id;
  String ingredientName;
  String type;
  int amount;
  bool? isSelected;

  Ingredients({
    required this.id,
    required this.ingredientName,
    required this.type,
    required this.amount,
    this.isSelected,
  });

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientsToJson(this);

  onSelected(bool value) {
    this.isSelected = value;
  }
}

@JsonSerializable()
class Tags {
  int id;
  String name;
  bool? isSelected;

  Tags({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  onSelected(bool value) {
    this.isSelected = value;
  }

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}

@JsonSerializable()
class Instructions {
  int id;
  String instructionsDescription;
  bool hasTimer;
  int? timer;
  bool? timerOn;

  Instructions({
    required this.id,
    required this.instructionsDescription,
    required this.hasTimer,
    this.timer,
    this.timerOn = false,
  });

  timerTurn(bool value) {
    this.timerOn = value;
  }

  factory Instructions.fromJson(Map<String, dynamic> json) =>
      _$InstructionsFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionsToJson(this);
}
