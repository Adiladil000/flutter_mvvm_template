import '../constants/enums/http_request_enum.dart';

extension NetworkTypeExtension on HttpType {
  String? get rawValue {
    switch (this) {
      case HttpType.GET:
        return 'GET';
      case HttpType.POST:
        return 'POST';
      default:
        throw "ERROR TYPE";
    }
  }
}
