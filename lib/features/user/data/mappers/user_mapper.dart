import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../domain/entities/user.dart';
import '../../domain/entities/user_type.dart';

extension UserMapper on ParseObject {
  User toUser() {
    final user = User(
      id: objectId!,
      createdAt: createdAt!,
      updatedAt: updatedAt!,
      emailVerified: get("emailVerified") ?? false,
      username: get("username"),
      email: get("email") ?? '',
      type: UserType.fromValue(get("type")),
    );

    return user;
  }
}

extension UserListMapper on List<ParseObject> {
  List<User> toUserList() {
    final userList = map((e) => e.toUser()).toList();

    return userList;
  }
}
