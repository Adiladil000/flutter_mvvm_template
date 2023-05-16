import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/_product/_model/query/friend_query.dart';
import 'package:vexana/vexana.dart';

import '../model/social_user_model.dart';

abstract class ISocialServiceService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  ISocialServiceService(this.manager, this.scaffoldKey);

  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query);
  Future<List<SocialUser>> fetchUserNameQuery(String text);
  Future<SocialUser> fetchUser(id);
}
