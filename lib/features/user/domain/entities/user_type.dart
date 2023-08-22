import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum UserType {
  admin('admin'),
  manager('manager'),
  user('user'),
  influencer('influencer');

  const UserType(this.value);
  final String value;

  static UserType fromValue(String value) =>
      UserType.values.firstWhere((element) => element.value == value);
}
