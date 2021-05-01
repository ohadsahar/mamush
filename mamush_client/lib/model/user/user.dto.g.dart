// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return UserDTO(
    id: json['id'] as int,
    phoneNumber: json['phoneNumber'] as String,
    fullName: json['fullName'] as String,
    profilePicture: json['profilePicture'] as String?,
  );
}

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'fullName': instance.fullName,
      'profilePicture': instance.profilePicture,
    };
