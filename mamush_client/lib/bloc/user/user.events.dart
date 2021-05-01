import 'package:momrecipes/model/user/user.dto.dart';

enum EUserEvents { update, getMe }

class UserEvents {
  late UserDTO userDTO;
  late EUserEvents eventType;

  UserEvents.update(UserDTO userDTO) {
    this.eventType = EUserEvents.update;
    this.userDTO = userDTO;
  }

  UserEvents.getMe() {
    this.eventType = EUserEvents.getMe;
  }
}
