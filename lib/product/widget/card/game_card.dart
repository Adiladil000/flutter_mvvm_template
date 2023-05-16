// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
    required this.model,
    this.onPressed,
  }) : super(key: key);

  final GameModel model;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingLow,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: Center(child: Image.network(model.image.toString()))),
          Text(model.name.toString()),
          Text("\$ ${model.money}"),
        ]),
      ),
    );
  }
}
