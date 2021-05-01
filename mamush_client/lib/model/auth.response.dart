import 'package:json_annotation/json_annotation.dart';

part 'auth.response.g.dart';

@JsonSerializable()
class AuthResponse {
  RegisterResponse data;
  bool success;

  AuthResponse({required this.data, required this.success});

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  User user;
  String jwt;

  RegisterResponse({required this.user, required this.jwt});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}

@JsonSerializable()
class User {
  int id;
  String phoneNumber;
  String? fullName;

  User({
    required this.id,
    required this.phoneNumber,
    this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
