import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.dto.g.dart';

@JsonSerializable()
class UserDTO {
  int id;
  String phoneNumber;
  String fullName;
  String? profilePicture;

  UserDTO({
    required this.id,
    required this.phoneNumber,
    required this.fullName,
    this.profilePicture,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  Future<FormData> toFormData() async {
    final map = toJson();
    if (profilePicture != null && profilePicture != '') {
      map['profilePicture'] = await MultipartFile.fromFile(profilePicture!);
    }
    return FormData.fromMap(map);
  }
}
