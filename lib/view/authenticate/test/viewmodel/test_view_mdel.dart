import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enums/app_theme_enum.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/network/iresponse_model.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../model/test_model.dart';

part 'test_view_mdel.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context as ReactiveContext;

  @override
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context as BuildContext, listen: false).changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    //final list =  await NetworkManager.instance!.dioGet<TestModel>('x', TestModel());
    final response = await coreDio.fetch<IResponseModel<List<TestModel>>, TestModel>(
      'x',
      type: HttpType.GET,
      parseModel: TestModel(),
    );

    if (response is List<TestModel>) {
      //print true;
    } else {
      response!.error;
    }
    isLoading = false;
  }
}
