import 'package:equatable/equatable.dart';
import 'package:momrecipes/model/auth.response.dart';
import 'package:momrecipes/model/user/user.dto.dart';
import 'package:momrecipes/model/user/user.response.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
  UserResponse get user => this.user;
}

class UserInitState extends UserState {}

class UserLoadingState extends UserState {}

class UserUpdateState extends UserState {
  final UserResponse user;

  UserUpdateState({
    required this.user,
  });
}

class UserUpdateSuccessState extends UserState {
  final UserResponse user;
  UserUpdateSuccessState({
    required this.user,
  });
}
