import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GetStorageModule {
  @preResolve
  Future<GetStorage> get storage async {
    await GetStorage.init();
    return GetStorage();
  }
}
