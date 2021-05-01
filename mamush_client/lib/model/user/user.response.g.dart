// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateResponse _$UserUpdateResponseFromJson(Map<String, dynamic> json) {
  return UserUpdateResponse(
    data: UserResponse.fromJson(json['data'] as Map<String, dynamic>),
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$UserUpdateResponseToJson(UserUpdateResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    id: json['id'] as int,
    phoneNumber: json['phoneNumber'] as String,
    fullName: json['fullName'] as String?,
    profilePicture: json['profilePicture'] == null
        ? null
        : AppFile.fromJson(json['profilePicture'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'fullName': instance.fullName,
      'profilePicture': instance.profilePicture,
    };

AppFile _$AppFileFromJson(Map<String, dynamic> json) {
  return AppFile(
    id: json['id'] as int,
    fileName: json['fileName'] as String,
    filePath: json['filePath'] as String,
  );
}

Map<String, dynamic> _$AppFileToJson(AppFile instance) => <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
    };
