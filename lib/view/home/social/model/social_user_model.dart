// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'social_user_model.g.dart';

@JsonSerializable()
class SocialUser extends INetworkModel<SocialUser> {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? company;
  String? image;

  SocialUser({this.name, this.company, this.image});

  SocialUser.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    name = json['name'] as String?;
    company = json['company'] as String?;
    image = json['image'] as String?;
  }

  @override
  Map<String, dynamic> toJson() {
    return _$SocialUserToJson(this);
  }

  @override
  SocialUser fromJson(Map<String, Object?> json) {
    return _$SocialUserFromJson(json);
  }

  @override
  bool operator ==(covariant SocialUser other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.company == company && other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ company.hashCode ^ image.hashCode;
  }
}
