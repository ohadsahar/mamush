import 'package:equatable/equatable.dart';
import 'package:momrecipes/model/auth.dto.dart';
import 'package:momrecipes/model/auth.response.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
  User get user => this.user;
}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthRegisterState extends AuthState {
  final AuthDTO authDTO;

  AuthRegisterState({
    required this.authDTO,
  });
}

class AuthRegisterSuccessState extends AuthState {
  final User user;

  AuthRegisterSuccessState({
    required this.user,
  });
}
