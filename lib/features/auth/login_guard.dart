import 'package:flutter_modular/flutter_modular.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class LoginGuard extends RouteGuard {
  LoginGuard() : super(redirectTo: '/auth/login');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    final user = await ParseUser.currentUser();

    return user != null;
  }
}
