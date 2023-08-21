import 'package:multiple_result/multiple_result.dart';

import '../../../user/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<Result<bool, Exception>> login(String username, String password);
  Future<Result<Unit, Exception>> logout();
  Future<Result<bool, Exception>> isLoggedIn();
  Future<Result<User?, Exception>> getCurrentUser();
}
