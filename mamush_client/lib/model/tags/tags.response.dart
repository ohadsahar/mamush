import 'package:json_annotation/json_annotation.dart';
import 'package:momrecipes/model/recipe/recipe.response.dart';
import 'package:momrecipes/model/user/user.response.dart';

part 'tags.response.g.dart';

@JsonSerializable()
class TagsResponse {
  List<Tags> data;
  bool success;

  TagsResponse({
    required this.data,
    required this.success,
  });

  factory TagsResponse.fromJson(Map<String, dynamic> json) =>
      _$TagsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TagsResponseToJson(this);
}
