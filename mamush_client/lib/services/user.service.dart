import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:momrecipes/model/user/user.dto.dart';
import 'package:momrecipes/model/user/user.response.dart';
import 'package:momrecipes/services/storage.service.dart';

@lazySingleton
class UserService {
  final Dio dio;
  final StorageService storageService;
  UserService({
    required this.dio,
    required this.storageService,
  });

  Future<UserResponse> update(UserDTO userDTO) async {
    try {
      final String uri = '/user';
      final formData = await userDTO.toFormData();
      final response = await dio.put(uri, data: formData);

      final userResponse = UserUpdateResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
      return userResponse.data;
    } catch (e) {
      throw new Error();
    }
  }

  Future<UserResponse> getMe() async {
    final uri = '/user';
    final response = await dio.get(uri);
    final userResponse = UserUpdateResponse.fromJson(
      response.data as Map<String, dynamic>,
    );
    return userResponse.data;
  }
}
