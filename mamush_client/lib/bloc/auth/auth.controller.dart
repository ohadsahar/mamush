import 'package:momrecipes/model/auth.dto.dart';
import 'package:momrecipes/model/auth.response.dart';
import 'package:momrecipes/services/auth.service.dart';
import 'package:momrecipes/setup/injection.dart';

abstract class AuthRepo {
  Future<User> register(AuthDTO authDTO);
}

class AuthController extends AuthRepo {
  @override
  Future<User> register(AuthDTO authDTO) async {
    final AuthService authService = getIt<AuthService>();
    return await authService.register(authDTO);
  }
}
