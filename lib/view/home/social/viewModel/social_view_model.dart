import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_product/_utility/thorottle_helper.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../_product/_model/query/friend_query.dart';
import '../model/social_user_model.dart';
import '../service/i_social_service.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  final ISocialServiceService _socialService;

  int _page = 0;
  String _query = '';
  bool isLazyLoadDataFinish = false;

  late ThorottleStringHelper _thorottleStringHelper;

  @observable
  List<SocialUser> socialUserList = [];
  @observable
  bool isPageLoading = false;

  @observable
  bool isPageLoadingLazyLoad = false;

  _SocialViewModelBase(this._socialService);

  void setContext(BuildContext context) => this.context = context as ReactiveContext;
  void init() {
    _thorottleStringHelper = ThorottleStringHelper();
    _fetchAllUser();
  }

  @action
  Future<void> _fetchAllUser() async {
    _changeLoading();
    final response = await _socialService.fetchUserHouseList(FriendQuery());

    socialUserList = response;
    _changeLoading();
  }

  @action
  Future<void> fetchAllUserLoading(int index) async {
    if (isPageLoadingLazyLoad || index != socialUserList.length - 1 || isLazyLoadDataFinish) return;
    _changeLoading();
    final response = await _socialService.fetchUserHouseList(FriendQuery(limit: _page + 1, q: _query));
    if (response.isNotEmpty) {
      if (socialUserList.isEmpty) {
        socialUserList = response;
      } else if (response.last != socialUserList.last) {
        socialUserList.addAll(response);
        socialUserList = socialUserList;
      }
    }

    _changeLoading();
  }

  @action
  void fetchAllSearchQuery(String text) {
    _thorottleStringHelper.onDelayTouch(text, (text) {
      if (_query.isEmpty) {
        _page = -1;
      }

      _query = text;
      isLazyLoadDataFinish = false;
      socialUserList = [socialUserList.length - 1 as SocialUser];
      fetchAllUserLoading(0);
    });
  }

  @action
  void _changeLoading() {
    isPageLoading = !isPageLoading;
  }

  @action
  void _changeLoadingLazyLoad() {
    isPageLoadingLazyLoad = !isPageLoadingLazyLoad;
  }
}
