import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import 'iresponse_model.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>>? fetch<R, T extends BaseModel>(String path,
      {required HttpType type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress}) {
    return null;
  }
}

abstract class ICoreDioFull extends ICoreDio {
  Future<IResponseModel<R>>? fetchNoNetwork<R, T extends BaseModel>(String path,
      {required HttpType type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress}) {
    return null;
  }
}
