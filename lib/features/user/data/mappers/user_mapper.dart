import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:influencer_app/features/user/domain/entities/user_type.dart';

import '../../domain/entities/user.dart';

extension ToEntity on ParseObject {
  User toUser() {
    final user = User(
      id: get("objectId"),
      createdAt: get("createdAt"),
      updatedAt: get("updatedAt"),
      emailVerified: get("emailVerified") ?? false,
      username: get("username"),
      email: get("email") ?? '',
      type: UserType.fromValue(get("type")),
    );

    return user;
  }
}
