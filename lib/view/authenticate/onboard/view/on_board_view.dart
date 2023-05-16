import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../../../core/components/text/auto_local_text.dart';
import '../../../../core/extension/context_extension.dart';
import '../../../_product/_widgets/avatar/on_board_circle.dart';
import '../model/on_board_model.dart';
import '../viewModel/on_board_view_model.dart';

class OnBoardView extends StatefulWidget {
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) => Scaffold(
        body: Padding(
          padding: context.paddingNormalHorizontal,
          child: Column(
            children: [
              const Spacer(flex: 1),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(flex: 2, child: buildRowFooter(viewModel, context)),
            ],
          ),
        ),
      ),
    );
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      itemCount: viewModel.onBoardItems.length,
      onPageChanged: (value) {
        viewModel.changeCurrentIndex(value);
      },
      itemBuilder: (context, index) => buildColumnBody(context, viewModel.onBoardItems[index]),
    );
  }

  Row buildRowFooter(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildListViewCircle(viewModel),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(visible: viewModel.isLoading, child: const CircularProgressIndicator());
        }))),
        buildfloatingActionButtonSkip(context, viewModel)
      ],
    );
  }

  ListView buildListViewCircle(OnBoardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(
          builder: (_) {
            return OnBoardCircle(
              isSelected: viewModel.currentIndex == index,
            );
          },
        );
      },
    );
  }

  FloatingActionButton buildfloatingActionButtonSkip(BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
        backgroundColor: context.colors.secondaryContainer,
        child: Icon(
          Icons.chevron_right_rounded,
          color: context.colors.primaryContainer,
        ),
        onPressed: () => viewModel.complateToOnBoard());
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSVGPicture(model.imagePath)),
        buildColumnDescription(context, model),
      ],
    );
  }

  Column buildColumnDescription(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        buildAutoLocaleTextTitle(model, context),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildAutoLocaleTextDescription(model, context),
        )
      ],
    );
  }

  AutoLocaleText buildAutoLocaleTextTitle(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.title,
      style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.bold),
      textAlign: null,
    );
  }

  AutoLocaleText buildAutoLocaleTextDescription(OnBoardModel model, BuildContext context) {
    return AutoLocaleText(
      value: model.description,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w100),
    );
  }

  SvgPicture buildSVGPicture(String path) => SvgPicture.asset(path);
}
