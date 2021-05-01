import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/user/user.controller.dart';
import 'package:momrecipes/bloc/user/user.events.dart';
import 'package:momrecipes/bloc/user/user.state.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final UserController userController;

  UserBloc({
    required this.userController,
  }) : super(UserInitState());

  @override
  Stream<UserState> mapEventToState(UserEvents event) async* {
    switch (event.eventType) {
      case EUserEvents.update:
        try {
          yield UserLoadingState();
          final user = await userController.update(event.userDTO);
          yield UserUpdateState(
            user: user,
          );
          final NavigationService navigationService =
              getIt<NavigationService>();
          navigationService.navigateReplace(
            Routes.homeScreen,
            null,
          );
          break;
        } catch (e) {
          throw new Error();
        }
      case EUserEvents.getMe:
        yield UserLoadingState();
        final user = await userController.getMe();
        yield UserUpdateState(user: user);
        break;
    }
  }
}
