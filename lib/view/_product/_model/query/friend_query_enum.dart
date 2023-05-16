enum FriendQueryEnum { LIMIT, Q }

extension FriendQueryEnumExtension on FriendQueryEnum {
  String get rawValue {
    switch (this) {
      case FriendQueryEnum.LIMIT:
        return 'limit';
      case FriendQueryEnum.Q:
        return 'q';
      default:
        throw Exception('Routes Not Found');
    }
  }
}
