import 'package:vexana/vexana.dart';
import '../../../_product/_model/query/friend_query.dart';
import '../../../_product/_model/query/friend_query_enum.dart';
import '../../../_product/_utility/service_helper.dart';
import '../../../_product/enum/network_route_enum.dart';
import '../model/social_user_model.dart';
import 'i_social_service.dart';

class SocialService extends ISocialServiceService with ServiceHelper {
  SocialService(super.manager, super.scaffoldKey);

  @override
  Future<SocialUser> fetchUser(id) {
    final response =
        manager.send<SocialUser, SocialUser>(urlSuffix: '/$id', NetworkRoutes.FRIENDS.rawValue, parseModel: SocialUser(), method: RequestType.GET);
    showMessage(scaffoldKey!, response.error);
    return response.data;
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query) async {
    final response = await manager.send<SocialUser, List<SocialUser>>(NetworkRoutes.FRIENDS.rawValue,
        parseModel: SocialUser(),
        method: RequestType.GET,
        queryParameters: {FriendQueryEnum.LIMIT.rawValue: query.limit, FriendQueryEnum.Q.rawValue: query.q});
    showMessage(scaffoldKey!, response.error as IErrorModel<dynamic>);
    return response.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}
