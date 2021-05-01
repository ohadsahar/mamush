import 'package:momrecipes/model/auth.dto.dart';

enum EAuthEvents { register }

class AuthEvents {
  late AuthDTO authDTO;
  late EAuthEvents eventType;

  AuthEvents.register(AuthDTO authDTO) {
    this.eventType = EAuthEvents.register;
    this.authDTO = authDTO;
  }
}
