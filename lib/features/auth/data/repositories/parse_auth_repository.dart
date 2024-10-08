import 'package:multiple_result/multiple_result.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../core/error/parse_error_code.dart';
import '../../../../core/shared/extensions/parse_error_log.dart';
import '../../../../core/shared/extensions/parse_response_exception.dart';
import '../../../user/domain/entities/user.dart';

import 'auth_repository_interface.dart';

class ParseAuthRepository implements IAuthRepository {
  @override
  Future<Result<User, Exception>> getCurrentUser() {
    // final
    throw UnimplementedError();
  }

  @override
  Future<Result<bool, Exception>> isLoggedIn() async {
    final user = await ParseUser.currentUser() as ParseUser?;

    return Result.success(user != null);
  }

  @override
  Future<Result<bool, Exception>> login(
      String username, String password) async {
    final user = ParseUser(username, password, null);
    final response = await user.login();

    if (response.success) {
      return const Result.success(true);
    } else {
      response.error?.logMessage("login failed", name: runtimeType.toString());
      if (response.error?.code == ParseErrorCode.objectNotFound.code) {
        return const Result.success(false);
      }

      return Result.error(response.getException());
    }
  }

  @override
  Future<Result<Unit, Exception>> logout() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    if (user != null) {
      final response = await user.logout();
      if (response.success) {
        return const Result.success(unit);
      } else {
        response.error
            ?.logMessage("logout failed", name: runtimeType.toString());
        return Result.error(response.getException());
      }
    }

    return const Result.success(unit);
  }
}
