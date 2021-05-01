import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:momrecipes/bloc/auth/auth.controller.dart';
import 'package:momrecipes/bloc/auth/auth.events.dart';
import 'package:momrecipes/bloc/auth/auth.state.dart';
import 'package:momrecipes/constants/routes.dart';
import 'package:momrecipes/services/navigation.service.dart';
import 'package:momrecipes/setup/injection.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  final AuthController authController;

  AuthBloc({
    required this.authController,
  }) : super(AuthInitState());

  @override
  Stream<AuthState> mapEventToState(AuthEvents event) async* {
    switch (event.eventType) {
      case EAuthEvents.register:
        try {
          yield AuthLoadingState();
          final user = await authController.register(event.authDTO);
          yield AuthRegisterSuccessState(
            user: user,
          );
          final NavigationService navigationService =
              getIt<NavigationService>();
          navigationService.navigateReplace(Routes.completeProfileScreen, null);
          break;
        } catch (e) {
          throw new Error();
        }
    }
  }
}
