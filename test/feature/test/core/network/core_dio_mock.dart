import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';
import 'package:fluttermvvmtemplate/core/constants/enums/http_request_enum.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:fluttermvvmtemplate/core/extension/network_extension.dart';
import 'package:fluttermvvmtemplate/core/init/network/icore_dio.dart';
import 'package:fluttermvvmtemplate/core/init/network/iresponse_model.dart';

class CoreDioMock with DioMixin implements ICoreDioFull, Dio {
  @override
  final BaseOptions options;

  CoreDioMock(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }
  @override
  Future<IResponseModel<R>>? fetch<R, T extends BaseModel>(String path,
      {required HttpType type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final response = await request(path, data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final response = _responseParser<R, T>(parseModel, response.data);

        return ResponseModel<R>(data: model);
      default:
        return BaseError('message') as dynamic;
    }
  }

  @override
  Future<IResponseModel<R>>? fetchNoNetwork<R, T extends BaseModel>(String path,
      {required HttpType type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    String dumyJson = """[{
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  }]""";

    final response = jsonDecode(dumyJson);
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R, T>(parseModel, response);

        return ResponseModel<R>(data: model);
      default:
        return BaseError('message') as dynamic;
    }
  }

  R _responseParser<R, T>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map((e) => model.fromJson(e)).toList().cast<T>() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, Object>) as R;
    }
    return data as R;
  }
}
