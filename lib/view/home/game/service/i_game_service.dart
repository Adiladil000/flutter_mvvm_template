import 'package:fluttermvvmtemplate/view/home/game/model/game_enums.dart';
import 'package:vexana/vexana.dart';

import '../model/game_model.dart';
import '../model/slider_model.dart';

abstract class IGameService {
  final INetworkManager manager;

  IGameService(this.manager);

  Future<List<SliderModel>> fetchSliderItems;
  Future<List<GameModel>> fetchGameItems(GameEnum type);
}
