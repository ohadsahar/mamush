import 'package:json_annotation/json_annotation.dart';

part 'user.response.g.dart';

@JsonSerializable()
class UserUpdateResponse {
  UserResponse data;
  bool success;

  UserUpdateResponse({
    required this.data,
    required this.success,
  });

  factory UserUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  int id;
  String phoneNumber;
  String? fullName;
  AppFile? profilePicture;

  UserResponse({
    required this.id,
    required this.phoneNumber,
    this.fullName,
    this.profilePicture,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class AppFile {
  int id;
  String fileName;
  String filePath;

  AppFile({
    required this.id,
    required this.fileName,
    required this.filePath,
  });

  factory AppFile.fromJson(Map<String, dynamic> json) =>
      _$AppFileFromJson(json);

  Map<String, dynamic> toJson() => _$AppFileToJson(this);
}
