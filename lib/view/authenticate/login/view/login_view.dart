import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/constants/image/image_contants.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => DefaultTabController(
        length: 2,
        child: Scaffold(
            key: value.scaffoldState,
            body: SafeArea(
              child: Column(
                children: [
                  buildAnimatedContainer(context),
                  buildContainerTabBar(context),
                  Expanded(
                    flex: 6,
                    child: Padding(padding: context.paddingNormal, child: buildForm(value, context)),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
        duration: context.lowDuration,
        height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
        color: Colors.white,
        child: Center(child: Image.asset(ImageConstants.instace!.hotDog)));
  }

  Container buildContainerTabBar(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Padding(
        padding: EdgeInsets.only(left: context.width * 0.1, right: context.width * 0.1, bottom: context.width * 0.01),
        child: buildTabBar(context),
      ),
    );
  }

  TabBar buildTabBar(BuildContext context) {
    return TabBar(
        indicatorWeight: 5,
        indicatorColor: Colors.yellow,
        labelStyle: context.textTheme.headline5,
        unselectedLabelStyle: context.textTheme.headline5,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: Colors.black,
        tabs: [
          Tab(text: LocaleKeys.login_tab1.tr()),
          Tab(text: LocaleKeys.login_tab2.tr()),
        ]);
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: value.formState,
      child: Column(
        children: [
          const Spacer(
            flex: 6,
          ),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          const Spacer(),
          buildTextForgot(),
          const Spacer(
            flex: 6,
          ),
          buildRaisedButtonLogin(context, value),
          buildWrapForgot(),
          const Spacer()
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: ((value) => value!.isNotEmpty ? null : "This field required"),
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
            labelStyle: context.textTheme.subtitle1,
            suffixIcon: FlatButton(
                onPressed: () {
                  viewModel.isLockStateChange();
                },
                padding: EdgeInsets.zero,
                child: Observer(builder: (_) {
                  return Icon(viewModel.isLockOpen ? Icons.lock : Icons.lock_open);
                })),
            labelText: LocaleKeys.login_password.tr(),
            icon: buildContainerIconFiled(context, Icons.password_outlined)),
      );
    });
  }

  TextFormField buildTextFormFieldEmail(BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: ((value) => value!.isValidEmails ? "asasa" : null),
      decoration: InputDecoration(
        labelStyle: context.textTheme.subtitle1,
        icon: buildContainerIconFiled(context, Icons.email_outlined),
        labelText: LocaleKeys.login_email.tr(),
      ),
    );
  }

  Container buildContainerIconFiled(BuildContext context, IconData icon) {
    return Container(
      color: context.colors.onError,
      padding: context.paddingLow,
      child: Icon(icon, color: context.colors.primaryContainer),
    );
  }

  Widget buildTextForgot() => Align(
      alignment: Alignment.centerRight, child: const Text(LocaleKeys.login_forgotText, textAlign: TextAlign.end).tr());

  Widget buildRaisedButtonLogin(BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return RaisedButton(
        shape: const StadiumBorder(),
        padding: context.paddingNormal,
        color: context.colors.onError,
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        child: Center(
          child: Text(
            LocaleKeys.login_login.tr(),
            style: context.textTheme.headline5,
          ),
        ),
      );
    });
  }

  Wrap buildWrapForgot() {
    return Wrap(children: [
      Text(LocaleKeys.login_dontAccount.tr()),
      FlatButton(onPressed: () {}, child: Text(LocaleKeys.login_tab2.tr()))
    ]);
  }
}
