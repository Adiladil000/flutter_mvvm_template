// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';

abstract class IResponseModel<T> {
  late T data;
  late BaseError error;
}

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T data;

  @override
  final BaseError error;

  ResponseModel({this.data, this.error});
}
