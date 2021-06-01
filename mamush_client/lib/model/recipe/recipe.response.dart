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
  List<RecipeIngredients>? recipeIngredients;
  List<Tags>? tags;
  List<Instructions>? instructions;
  AppFile? recipePicture;

  Recipe({
    required this.id,
    required this.recipeName,
    this.recipeIngredients,
    this.tags,
    this.instructions,
    this.recipePicture,
  });
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class RecipeIngredients {
  int? id;
  String type;
  String amount;
  Ingredient ingredient;
  bool? isSelected;

  RecipeIngredients({
    this.id,
    required this.type,
    required this.amount,
    required this.ingredient,
    this.isSelected,
  });

  factory RecipeIngredients.fromJson(Map<String, dynamic> json) =>
      _$RecipeIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeIngredientsToJson(this);

  onSelected(bool value) {
    this.isSelected = value;
  }
}

@JsonSerializable()
class Ingredient {
  int id;
  String ingredientName;

  Ingredient({
    required this.id,
    required this.ingredientName,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
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
  int? id;
  String instructionsDescription;
  bool hasTimer;
  int? timer;
  bool? timerOn;
  bool? expended;

  Instructions({
    this.id,
    required this.instructionsDescription,
    required this.hasTimer,
    this.timer,
    this.timerOn = false,
    this.expended = false,
  });

  timerTurn(bool value) {
    this.timerOn = value;
  }

  factory Instructions.fromJson(Map<String, dynamic> json) =>
      _$InstructionsFromJson(json);

  Map<String, dynamic> toJson() => _$InstructionsToJson(this);
}
