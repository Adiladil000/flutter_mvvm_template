import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../init/cache/locale_manager.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/ICore_Dio.dart';
import '../../init/network/network_manager.dart';
import '../../init/network/vexana_manager.dart';

abstract class BaseViewModel {
  late ReactiveContext context;

  ICoreDio coreDio = NetworkManager.instance?.coreDio as ICoreDio;
  VexanaManager? vexanaManager = VexanaManager.instance;
  LocaleManager localeManager = LocaleManager.instance;

  NavigationService navigationService = NavigationService.instance;
  void setContext(BuildContext context);
  void init();
}
