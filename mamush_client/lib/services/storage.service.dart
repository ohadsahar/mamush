import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:momrecipes/constants/storage_keys.dart';

@injectable
class StorageService {
  final GetStorage _getStorage;
  StorageService(
    this._getStorage,
  );

  void setToken(String token) {
    _getStorage.write(StorageKeys.token, token);
  }

  String get token {
    return _getStorage.read(StorageKeys.token) ?? '';
  }
}
