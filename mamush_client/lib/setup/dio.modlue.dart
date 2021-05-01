import 'dart:io';

import 'package:dio/dio.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:injectable/injectable.dart';
import 'package:momrecipes/constants/config_keys.dart';
import 'package:momrecipes/constants/storage_keys.dart';
import 'package:momrecipes/services/storage.service.dart';

import 'injection.dart';

@module
abstract class DioModule {
  @preResolve
  Future<Dio> get dio async {
    final Dio _dio = Dio();
    final String apiUrl =
        getIt<GlobalConfiguration>().getValue<String>(ConfigKeys.apiUrl);
    _dio.options.baseUrl = apiUrl;
    _dio.interceptors.add(
      InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) {
        final String? token = getIt<StorageService>().token;
        options.headers["token"] = token;
        options.headers = {
          ...options.headers,
          HttpHeaders.authorizationHeader: '${StorageKeys.bearer} $token'
        };
        options.headers = {
          ...options.headers,
          HttpHeaders.contentTypeHeader: StorageKeys.jsonType
        };
        handler.next(options);
      }, onResponse: (response, handler) {
        handler.next(response);
      }, onError: (DioError e, handler) {
        handler.next(e);
      }),
    );
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    return _dio;
  }
}
