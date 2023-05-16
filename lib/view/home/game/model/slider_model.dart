import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'slider_model.g.dart';

@JsonSerializable()
class SliderModel extends INetworkModel<SliderModel> {
  final String image;
  final String text;
  final String detailId;

  SliderModel(this.image, this.text, this.detailId);

  @override
  GameModel fromJson(Map<String, dynamic> json) {
    return _$GameModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$GameModelToJson(this);
  }
}
