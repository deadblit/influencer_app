// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      emailVerified: json['emailVerified'] as bool? ?? false,
      username: json['username'] as String,
      email: json['email'] as String,
      type: $enumDecode(_$UserTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'emailVerified': instance.emailVerified,
      'username': instance.username,
      'email': instance.email,
      'type': _$UserTypeEnumMap[instance.type]!,
    };

const _$UserTypeEnumMap = {
  UserType.admin: 'admin',
  UserType.manager: 'manager',
  UserType.user: 'user',
  UserType.influencer: 'influencer',
};
