import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kartal/kartal.dart';

class GameSlider extends StatefulWidget {
  final List<String> imageUrls;
  const GameSlider({Key? key, required this.imageUrls}) : super(key: key);

  @override
  State<GameSlider> createState() => _GameSliderState();
}

class _GameSliderState extends State<GameSlider> {
  int _selectedValueIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: buildPageView(),
        ),
        Expanded(child: buildListViewCircleIndicator())
      ],
    );
  }

  PageView buildPageView() {
    return PageView.builder(
        controller: PageController(viewportFraction: 0.95),
        onPageChanged: _changeValue,
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index) => buildCardImage(index));
  }

  void _changeValue(int index) {
    _selectedValueIndex = index;
    setState(() {});
  }

  Widget buildCardImage(int index) => CachedNetworkImage(imageUrl: widget.imageUrls[index]);

  ListView buildListViewCircleIndicator() {
    return ListView.builder(
      itemCount: widget.imageUrls.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.all(context.dynamicWidth(0.01)),
        child: CircleAvatar(
          backgroundColor: _selectedValueIndex == index ? context.colorScheme.onError : context.colorScheme.onError.withOpacity(0.1),
        ),
      ),
    );
  }
}
