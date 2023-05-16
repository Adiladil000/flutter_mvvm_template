import 'package:flutter/material.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/init/network/vexana_manager.dart';
import '../model/login_model.dart';
import '../service/ilogin_service.dart';
import '../service/login_service.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  ILoginService? loginService;

  TextEditingController? emailController;
  TextEditingController? passwordController;
  @override
  void setContext(BuildContext context) => this.context = context as ReactiveContext;
  @override
  void init() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    loginService = LoginService(VexanaManager.instance.networkManager);
  }

  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  @action
  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }

  @action
  void isLoadingChange() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetchLoginService() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService!.fetchUserControl(LoginModel(email: emailController!.text, password: passwordController!.text));

      scaffoldState.currentState!.showSnackBar(SnackBar(content: Text(response.token.toString())));
      localeManager.setStringValue(PreferencesKeys.TOKEN, response.token.toString());
    }
    isLoadingChange();
  }
}
