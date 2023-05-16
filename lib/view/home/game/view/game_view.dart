import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';
import 'package:fluttermvvmtemplate/product/model/pageview/game_slider.dart';
import 'package:fluttermvvmtemplate/product/widget/button/header_button.dart';
import 'package:fluttermvvmtemplate/product/widget/card/game_card.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_view_state.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/base/view/base_widget.dart';
import '../viewModel/game_view_model.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<GameViewModel>(
      viewModel: GameViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, GameViewModel value) => Scaffold(
          appBar: AppBar(
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined))],
            leading: Icon(Icons.rounded_corner_outlined),
            title: Text(
              LocaleKeys.home_game_title.tr(),
              style: context.textTheme.headline5!.copyWith(color: context.colorScheme.onError, fontWeight: FontWeight.w600),
            ),
          ),
          body: DefaultTabController(
            length: value.gameTabItems.length,
            child: ListView.builder(
              itemCount: GameViewItems.values.length,
              itemBuilder: (context, index) {
                switch (GameViewItems.values[index]) {
                  case GameViewItems.SEARCH_BAR:
                    return buildPaddingSearchBar(context);

                  case GameViewItems.TABBAR:
                    return TabBar(
                        isScrollable: true,
                        indicatorColor: context.colorScheme.onError,
                        labelPadding: EdgeInsets.zero,
                        indicatorWeight: 3,
                        tabs: value.gameTabItems
                            .map((e) => Tab(
                                  child: Padding(
                                    padding: context.paddingLow,
                                    child: Text(e.tr()),
                                  ),
                                ))
                            .toList());

                  case GameViewItems.SLIDER:
                    return Padding(
                      padding: context.verticalPaddingLow,
                      child: buildSizedBoxSlider(context),
                    );

                  case GameViewItems.NEW_UPDATE_GAMES_CARD:
                    return Column(
                      children: [
                        HeaderButton(titleText: LocaleKeys.home_game_newUpdate),
                        GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8, crossAxisCount: 3),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) => GameCard(
                            model: GameModel(name: 'a ', money: 100, image: "wekil url"),
                          ),
                        )
                      ],
                    );
                  case GameViewItems.TOP_UPDATE_GAMES_CARD:
                    return Column(
                      children: [
                        HeaderButton(titleText: LocaleKeys.home_game_newUpdate),
                        GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 0.8, crossAxisCount: 3),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (context, index) => GameCard(
                            model: GameModel(name: 'a ', money: 100, image: "wekil url"),
                          ),
                        )
                      ],
                    );
                  default:
                    throw Exception("STATE NOT FOUND");
                  //return Card(child: Text('data'));
                }
              },
            ),
          )),
    );
    ;
  }

  SizedBox buildSizedBoxSlider(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(0.32),
        child: GameSlider(
          imageUrls: ["Wekil linkin qoy", "Wekil linkin qoy"],
        ));
  }

  Padding buildPaddingSearchBar(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: TextField(
        decoration: InputDecoration(prefixIcon: Icon(Icons.search_outlined)),
      ),
    );
  }
}
