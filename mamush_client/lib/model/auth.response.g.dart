// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return AuthResponse(
    data: RegisterResponse.fromJson(json['data'] as Map<String, dynamic>),
    success: json['success'] as bool,
  );
}

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return RegisterResponse(
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    jwt: json['jwt'] as String,
  );
}

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'jwt': instance.jwt,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    phoneNumber: json['phoneNumber'] as String,
    fullName: json['fullName'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'fullName': instance.fullName,
    };
