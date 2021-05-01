import 'package:momrecipes/model/auth.response.dart';
import 'package:momrecipes/model/user/user.dto.dart';
import 'package:momrecipes/model/user/user.response.dart';
import 'package:momrecipes/services/user.service.dart';
import 'package:momrecipes/setup/injection.dart';

abstract class UserRepo {
  Future<UserResponse> update(UserDTO userDTO);
  Future<UserResponse> getMe();
}

class UserController extends UserRepo {
  @override
  Future<UserResponse> update(UserDTO userDTO) async {
    final UserService userService = getIt<UserService>();
    return await userService.update(userDTO);
  }

  @override
  Future<UserResponse> getMe() async {
    final UserService userService = getIt<UserService>();
    return await userService.getMe();
  }
}
