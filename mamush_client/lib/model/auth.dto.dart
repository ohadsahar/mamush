import 'package:json_annotation/json_annotation.dart';

part 'auth.dto.g.dart';

@JsonSerializable()
class AuthDTO {
  String phoneNumber;

  AuthDTO({
    required this.phoneNumber,
  });

  factory AuthDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDTOToJson(this);
}
