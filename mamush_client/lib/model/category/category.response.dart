import 'package:json_annotation/json_annotation.dart';
import 'package:momrecipes/model/user/user.response.dart';
part 'category.response.g.dart';

@JsonSerializable()
class CategoryResponse {
  List<Category> data;
  bool success;

  CategoryResponse({
    required this.data,
    required this.success,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class Category {
  int id;
  String name;
  AppFile categoryPicture;

  Category({
    required this.id,
    required this.name,
    required this.categoryPicture,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
