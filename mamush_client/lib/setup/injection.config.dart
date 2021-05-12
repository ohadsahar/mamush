// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import '../services/auth.service.dart' as _i10;
import '../services/category.service.dart' as _i11;
import '../services/ingrediants.service.dart' as _i5;
import '../services/navigation.service.dart' as _i6;
import '../services/recipe.service.dart' as _i12;
import '../services/storage.service.dart' as _i7;
import '../services/tags.service.dart' as _i8;
import '../services/user.service.dart' as _i9;
import 'dio.modlue.dart' as _i13;
import 'get_storage.module.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.IngrediantService>(
      () => _i5.IngrediantService(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i6.NavigationService>(() => _i6.NavigationService());
  gh.factory<_i7.StorageService>(
      () => _i7.StorageService(get<_i4.GetStorage>()));
  gh.lazySingleton<_i8.TagsService>(() => _i8.TagsService(dio: get<_i3.Dio>()));
  gh.lazySingleton<_i9.UserService>(() => _i9.UserService(
      dio: get<_i3.Dio>(), storageService: get<_i7.StorageService>()));
  gh.lazySingleton<_i10.AuthService>(() => _i10.AuthService(
      dio: get<_i3.Dio>(), storageService: get<_i7.StorageService>()));
  gh.lazySingleton<_i11.CategoryService>(() => _i11.CategoryService(
      dio: get<_i3.Dio>(), storageService: get<_i7.StorageService>()));
  gh.lazySingleton<_i12.RecipeService>(() => _i12.RecipeService(
      dio: get<_i3.Dio>(), storageService: get<_i7.StorageService>()));
  return get;
}

class _$DioModule extends _i13.DioModule {}

class _$GetStorageModule extends _i14.GetStorageModule {}
