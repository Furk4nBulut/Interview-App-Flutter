import '../base/model/base_model.dart';
import 'IResponseModel.dart';
import 'package:interview_app/core/enum/http_request_enum.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(
      String path, {
        required HttpTypes type,
        required T parseModel,
        dynamic data,
        Map<String, Object>? queryParameters,
        void Function(int, int)? onReceiveProgress,
      });
}
// MARK: Null SAfety

abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> send<R, T>(
      String path, {
        required HttpTypes type,
        required BaseModel<T> parseModel,
        dynamic data,
        Map<String, Object>? queryParameters,
        void Function(int, int)? onReceiveProgress,
      });
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(
      String path, {
        required HttpTypes type,
        required T parseModel,
        dynamic data,
        Map<String, Object>? queryParameters,
        void Function(int, int)? onReceiveProgress,
      });
}

// MARK: Nul SAfety
abstract class ICoreDioFullNulSafetyFull extends ICoreDioNullSafety {
  Future<IResponseModel<R>> fetchNoNetwork<R, T extends BaseModel>(
      String path, {
        required HttpTypes type,
        required T parseModel,
        dynamic data,
        Map<String, Object>? queryParameters,
        void Function(int, int)? onReceiveProgress,
      });
}