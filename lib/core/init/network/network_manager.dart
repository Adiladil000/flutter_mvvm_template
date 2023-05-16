import 'package:dio/dio.dart';

import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'core_dio.dart';
import 'icore_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  late ICoreDio coreDio;

  NetworkManager._init() {
    final baseOptions =
        BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/", headers: {"val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)});
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);
    //   _dio?.interceptors.add(InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       options.path += 'Adil';
    //     },
    //     // onResponse: (e,handler) {
    //     //   e.data;
    //     // },
    //     onError: (e, handler) {
    //       BaseError(e.message);
    //     },
    //   ));
    // }
  }
}
