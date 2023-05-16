import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/i_social_service.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/social_service.dart';

class SocialNetworkMock extends SocialService {
  SocialNetworkMock(super.manager, super.scaffoldKey);
}

class SocialNetworkMockAll extends ISocialServiceService {
  SocialNetworkMockAll(super.manager, super.scaffoldKey);

  @override
  Future<SocialUser> fetchUser(id) async {
    await Future.delayed(Duration(seconds: 1));
    return SocialUser(name: id);
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query) {
    // TODO: implement fetchUserHouseList
    throw UnimplementedError();
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    // TODO: implement fetchUserNameQuery
    throw UnimplementedError();
  }
}
