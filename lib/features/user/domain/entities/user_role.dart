import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum UserRole {
  admin('admin'),
  manager('manager'),
  user('user'),
  influencer('influencer');

  const UserRole(this.value);
  final String value;

  static UserRole fromValue(String value) =>
      UserRole.values.firstWhere((element) => element.value == value);
}
