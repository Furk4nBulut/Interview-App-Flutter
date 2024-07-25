import 'dart:io';
import 'package:dio/dio.dart';
import 'package:interview_app/core/base/model/base_error.dart';
import 'package:interview_app/core/base/model/base_model.dart';
import 'package:interview_app/core/network/core_dio.dart';
import '../cache/locale_manager.dart';
import '../enum/local_keys_enum.dart';
import 'ICoreDio.dart';

class NetworkManager {
  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      headers: {'val': LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)},
    );
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);

    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options) {
    //     options.path += "veli";
    //   },
    //   onError: (e) {
    //     return BaseError(e.message);
    //   },
    // ));
  }
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;
}