import 'package:flutter/material.dart';
import '../model/house_model.dart';
import '../service/build_feed_service.dart';
import '../service/ibuild_feed_service.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../_product/_utility/decoration_helper.dart';

part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context as ReactiveContext;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  IBuildFeedService? feedService;
  DecorationHelper? helper;

  @observable
  List<String> likeItems = [];

  void onLikeItemPressed(String id) {
    if (likeItems.contains(id)) {
      likeItems.remove(id);
    } else {
      likeItems.add(id);
    }

    likeItems = likeItems;
  }

  @observable
  List<HouseModel> houseModels = [];

  @computed
  HouseModel get sliderHouse => houseModels.first;

  @observable
  bool isLoading = false;

  @override
  void init() {
    helper = DecorationHelper(context: context as BuildContext);
    feedService = BuildFeedService(vexanaManager!.networkManager, scaffoldKey);
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getListAll() async {
    _changeLoading();
    houseModels = await feedService!.fetchUserHouseList();

    _changeLoading();
  }
}
