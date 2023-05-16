import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_widget.dart';
import '../../../../core/constants/enums/locale_keys_enum.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/test_view_mdel.dart';

class TestsView extends StatefulWidget {
  const TestsView({Key? key}) : super(key: key);

  @override
  State<TestsView> createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
      onDispose: () {},
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  AppBar appBar() {
    return AppBar(
      actions: [iconButtonChangeTheme()],
      title: textWelcomeWidget(),
      leading: Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
    );
  }

  IconButton iconButtonChangeTheme() {
    return IconButton(
        onPressed: () {
          context.setLocale(LanguageManager.instance!.enLocale);
        },
        icon: const Icon(Icons.change_history));
  }

  Widget get textNumber {
    return Observer(
      builder: (context) => Text(
        viewModel.number.toString(),
      ),
    );
  }

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel.incrementNumber(),
    );
  }
}

extension _FormArea on _TestsViewState {
  TextFormField get mailField => TextFormField(
        validator: (value) => value?.isValidEmail,
      );
}
