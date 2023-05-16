
import 'package:fluttermvvmtemplate/view/home/game/model/game_model.dart';
import 'package:fluttermvvmtemplate/view/home/game/model/game_enums.dart';
import 'package:fluttermvvmtemplate/view/home/game/service/i_game_service.dart';

import '../../../_product/enum/network_route_enum.dart';


class GameService extends IGameService {
  GameService(super.manager);

  @override
  Future<List<GameModel>> fetchGameItems(GameEnum type) {
    // TODO: implement fetchGameItems
    throw UnimplementedError();
  }

}
