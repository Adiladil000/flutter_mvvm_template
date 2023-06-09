import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/view/_product/_widgets/animation/social_card_animation.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/social_service.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../_product/_widgets/list-tile/friend_card.dart';
import '../viewModel/social_view_model.dart';

class SocialView extends StatelessWidget {
  SocialView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseView<SocialViewModel>(
      viewModel: SocialViewModel(SocialService(VexanaManager.instance.networkManager, scaffoldKey)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SocialViewModel viewModel) => Container(
        color: context.colorScheme.background,
        padding: context.paddingLow,
        child: Scaffold(
          appBar: buildAppBar(context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildTextFindFriends(context).tr(),
              Spacer(flex: 2),
              TextField(
                onChanged: ((value) {
                  viewModel.fetchAllUserLoading(value as int);
                }),
                decoration: InputDecoration(
                    suffixIcon: Icon(
                  Icons.search,
                  color: context.colorScheme.onSecondary.withOpacity(0.2),
                )),
              ),
              Spacer(flex: 2),
              Expanded(flex: 90, child: Observer(builder: (_) => buildListViewUser(viewModel)))
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: FlatButton(padding: EdgeInsets.zero, onPressed: () {}, child: Text(LocaleKeys.home_social_cancel.tr())),
      actions: [
        FlatButton(
            onPressed: () {},
            child: Text(
              LocaleKeys.home_social_next.tr(),
              style: context.textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.appTheme.buttonTheme.colorScheme!.onError,
              ),
            ))
      ],
    );
  }

  Text buildTextFindFriends(BuildContext context) {
    return Text(
      LocaleKeys.home_social_findFirends,
      style: context.textTheme.headline4!.copyWith(fontWeight: FontWeight.bold, color: context.colorScheme.onSecondary),
    );
  }

  Widget buildListViewUser(SocialViewModel viewModel) {
    return ListView.builder(
        itemCount: viewModel.socialUserList.length,
        itemBuilder: (context, index) {
          viewModel.fetchAllUserLoading(index);
          return OpenContainerSocailWrapper(
            socialUser: viewModel.socialUserList[index],
            closedBuilder: ((BuildContext _, VoidCallback openContainer) => FriendCard(
                  user: viewModel.socialUserList[index],
                  onPressed: openContainer,
                )),
          );
        });
  }
}
