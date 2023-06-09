// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/init/lang/locale_keys.g.dart';
import '../../../home/social/model/social_user_model.dart';

class FriendCard extends StatelessWidget {
  final SocialUser user;
  final VoidCallback onPressed;
  const FriendCard({Key? key, required this.user, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.image.toString()),
      ),
      title: Text(user.name.toString()),
      onTap: onPressed,
      subtitle: Text(user.company.toString()),
      trailing: RaisedButton(
        onPressed: () {},
        textColor: context.colorScheme.background,
        color: context.appTheme.buttonTheme.colorScheme!.onError,
        child: Text(LocaleKeys.home_social_follow).tr(),
      ),
    );
  }
}
