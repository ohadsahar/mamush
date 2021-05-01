// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagsResponse _$TagsResponseFromJson(Map<String, dynamic> json) {
  return TagsResponse(
    data: (json['data'] as List<dynamic>)
        .map((e) => Tags.fromJson(e as Map<String, dynamic>))
        .toList(),
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$TagsResponseToJson(TagsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };
