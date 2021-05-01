import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:momrecipes/model/auth.dto.dart';
import 'package:momrecipes/model/auth.response.dart';
import 'package:momrecipes/services/storage.service.dart';

@lazySingleton
class AuthService {
  final Dio dio;
  final StorageService storageService;
  AuthService({
    required this.dio,
    required this.storageService,
  });

  Future<User> register(AuthDTO authDTO) async {
    try {
      final String uri = '/auth/register';
      final response = await dio.post(
        uri,
        data: authDTO.toJson(),
      );
      final authResponse = AuthResponse.fromJson(
        response.data as Map<String, dynamic>,
      );
      this.storageService.setToken(
            authResponse.data.jwt,
          );
      return authResponse.data.user;
    } catch (e) {
      print(e);
      throw new Error();
    }
  }
}
