import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

class IndicatorListView extends StatelessWidget {
  final int itemCount;

  final int currentIndex;

  final Widget Function(int index) onListItem;
  const IndicatorListView({Key? key, required this.itemCount, required this.currentIndex, required this.onListItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: ((context, index) => buildPadding(context, index)));
  }

  Padding buildPadding(BuildContext context, int index) => Padding(
        padding: context.paddingLow,
        child: buildCircleAvatar(index, context),
      );

  CircleAvatar buildCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      backgroundColor: isCurrentIndex(index) ? Colors.black12 : Colors.blue,
      radius: isCurrentIndex(index) ? context.width * 0.03 : context.width * 0.015,
      child: AnimatedOpacity(
        opacity: opacityValue(index),
        duration: context.lowDuration,
        child: onListItem(index),
      ),
    );
  }

  double opacityValue(int index) => isCurrentIndex(index) ? 1 : 0;

  bool isCurrentIndex(int index) => currentIndex == index;
}
