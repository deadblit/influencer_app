import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../entities/user.dart';
import '../entities/user_type.dart';

abstract class UserRepository {
  Future<Result<User, Failure>> create({
    required String username,
    required String email,
    required UserType type,
    required String password,
  });

  Future<Result<User?, Failure>> delete(String id);

  Future<Result<User?, Failure>> get(String id);

  Future<Result<List<User>, Failure>> getAll();

  Future<Result<User?, Failure>> update({
    required String id,
    required String email,
    required UserType type,
  });
}
