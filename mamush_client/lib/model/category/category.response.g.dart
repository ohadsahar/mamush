// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) {
  return CategoryResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as int,
    name: json['name'] as String,
    categoryPicture:
        AppFile.fromJson(json['categoryPicture'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categoryPicture': instance.categoryPicture,
    };
