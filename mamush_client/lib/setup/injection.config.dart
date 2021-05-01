// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../services/auth.service.dart' as _i9;
import '../services/category.service.dart' as _i10;
import '../services/navigation.service.dart' as _i5;
import '../services/recipe.service.dart' as _i11;
import '../services/storage.service.dart' as _i6;
import '../services/tags.service.dart' as _i7;
import '../services/user.service.dart' as _i8;
import 'dio.modlue.dart' as _i12;
import 'get_storage.module.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  final getStorageModule = _$GetStorageModule();
  await gh.factoryAsync<_i3.Dio>(() => dioModule.dio, preResolve: true);
  await gh.factoryAsync<_i4.GetStorage>(() => getStorageModule.storage,
      preResolve: true);
  gh.lazySingleton<_i5.NavigationService>(() => _i5.NavigationService());
  gh.factory<_i6.StorageService>(
      () => _i6.StorageService(get<_i4.GetStorage>()));
  gh.lazySingleton<_i7.TagsService>(() => _i7.TagsService(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i8.UserService>(() => _i8.UserService(
      dio: get<_i3.Dio>(), storageService: get<_i6.StorageService>()));
  gh.lazySingleton<_i9.AuthService>(() => _i9.AuthService(
      dio: get<_i3.Dio>(), storageService: get<_i6.StorageService>()));
  gh.lazySingleton<_i10.CategoryService>(() => _i10.CategoryService(
      dio: get<_i3.Dio>(), storageService: get<_i6.StorageService>()));
  gh.lazySingleton<_i11.RecipeService>(() => _i11.RecipeService(
      dio: get<_i3.Dio>(), storageService: get<_i6.StorageService>()));
  return get;
}

class _$DioModule extends _i12.DioModule {}

class _$GetStorageModule extends _i13.GetStorageModule {}
