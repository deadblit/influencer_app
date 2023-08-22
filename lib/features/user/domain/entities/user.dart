import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_type.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool emailVerified,
    required String username,
    required String email,
    required UserType type,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
