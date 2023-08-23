import 'dart:developer';

import 'package:multiple_result/multiple_result.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/server_failure.dart';
import '../../data/mappers/user_mapper.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/user_type.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/parse_user_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final ParseUserDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<Result<User, Failure>> create(
      {required String username,
      required String email,
      required UserType type,
      required String password}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Result<User?, Failure>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<User?, Failure>> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Result<List<User>, Failure>> getAll() async {
    late final List<ParseObject> result;
    late final List<User> userList;
    try {
      result = await datasource.getAll();
      userList = result.toUserList();
    } on Exception catch (error) {
      log("getAll failed", error: error, name: runtimeType.toString());
      return Result.error(ServerFailure.fromError(error));
    }

    return Result.success(userList);
  }

  @override
  Future<Result<User?, Failure>> update(
      {required String id, required String email, required UserType type}) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
