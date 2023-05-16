import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:fluttermvvmtemplate/view/home/social/model/social_user_model.dart';
import 'package:fluttermvvmtemplate/view/home/social/service/social_service.dart';
import 'package:kartal/kartal.dart';

import '../service/i_social_service.dart';

class SocialUserViewDetail extends StatelessWidget {
  final SocialUser socialUser;

  final INetworkManager manager = VexanaManager.instance.networkManager;

  ISocialServiceService get socialServiceService => SocialService(manager, null);

  SocialUserViewDetail({Key? key, required this.socialUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: socialServiceService.fetchUser(socialUser.id).toBuild(
              onSuccess: (data) {
                return Center(child: Image.network(data!.image.toString()));
              },
              loadingWidget: CircularProgressIndicator(),
              notFoundWidget: Center(
                child: Text('Not Found'),
              ),
              onError: Text('error'),
            ));
  }
}
