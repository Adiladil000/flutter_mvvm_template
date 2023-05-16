import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';

import '../../../../../core/base/view/base_widget.dart';
import '../../../../../core/init/lang/locale_keys.g.dart';
import '../../../../_product/_widgets/card/build_user_card.dart';
import '../model/house_model.dart';
import '../viewmodel/build_feed_view_model.dart';

class BuildFeedView extends StatelessWidget {
  const BuildFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
      viewModel: BuildFeedViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        model.getListAll();
      },
      onPageBuilder: (BuildContext context, BuildFeedViewModel viewModel) => Scaffold(
        key: viewModel.scaffoldKey,
        appBar: buildAppBar(),
        body: DefaultTabController(
            length: 4,
            child: Observer(builder: (_) {
              return viewModel.isLoading
                  ? buildCenter()
                  : viewModel.houseModels.isEmpty
                      ? const Center(child: Text('Not Found'))
                      : buildListViewRecommended(viewModel, context);
            })),
      ),
    );
  }

  ListView buildListViewRecommended(BuildFeedViewModel viewModel, BuildContext context) {
    return ListView(
      padding: context.paddingLow,
      children: [
        buildTabBar(viewModel),
        buildSizedBoxLatestPageView(context, viewModel),
        context.emptySizedHeightBoxLow,
        Text(LocaleKeys.home_build_subTitle.tr(), style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.w600)),
        context.emptySizedHeightBoxLow,
        buildListBottom(viewModel)
      ],
    );
  }

  ListView buildListBottom(BuildFeedViewModel viewModel) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
          height: context.dynamicHeight(0.15),
          child: Card(
            child: Row(
              children: [
                Expanded(flex: 3, child: Image.network(viewModel.houseModels[index].image.toString())),
                Expanded(flex: 9, child: buildObserver(viewModel, index)),
              ],
            ),
          )),
      itemCount: 3,
      shrinkWrap: true,
    );
  }

  Observer buildObserver(BuildFeedViewModel viewModel, int index) {
    return Observer(builder: (_) {
      return BuildUserCard(
        model: viewModel.houseModels[index],
        isLiked: viewModel.likeItems.contains(viewModel.houseModels[index].id),
        onPressedLikeId: (id) {
          viewModel.onLikeItemPressed(id.toString());
        },
      );
    });
  }

  SizedBox buildSizedBoxLatestPageView(BuildContext context, BuildFeedViewModel viewModel) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.95),
        itemCount: 3,
        itemBuilder: (context, index) => buildStackFloaty(context, viewModel.sliderHouse, viewModel),
      ),
    );
  }

  TabBar buildTabBar(BuildFeedViewModel viewModel) {
    return TabBar(indicator: viewModel.helper!.circleDecoration, indicatorSize: TabBarIndicatorSize.label, tabs: [
      Tab(text: LocaleKeys.home_build_tabbar_tab1.tr()),
      Tab(text: LocaleKeys.home_build_tabbar_tab2.tr()),
      Tab(text: LocaleKeys.home_build_tabbar_tab3.tr()),
      Tab(text: LocaleKeys.home_build_tabbar_tab4.tr()),
    ]);
  }

  Center buildCenter() => const Center(child: CircularProgressIndicator());

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.format_align_left_outlined)),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))],
    );
  }

  Widget buildStackFloaty(BuildContext context, HouseModel model, BuildFeedViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(right: context.lowValue),
      child: Stack(children: [
        Positioned.fill(
            right: -50,
            left: -50,
            bottom: 100,
            child: Image.network(
              model.image.toString(),
              fit: BoxFit.cover,
            )),
        Positioned(top: 120, left: 10, right: 10, child: buildCardFloaty(context, model, viewModel))
      ]),
    );
  }

  Card buildCardFloaty(BuildContext context, HouseModel model, BuildFeedViewModel viewModel) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Observer(builder: (_) {
          return BuildUserCard(
            model: model,
            isLiked: viewModel.likeItems.contains(model.id),
            onPressedLikeId: (id) {
              viewModel.onLikeItemPressed(id.toString());
            },
          );
        }),
      ),
    );
  }
}
