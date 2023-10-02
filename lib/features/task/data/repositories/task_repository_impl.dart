import 'package:flutter_modular/flutter_modular.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/failure/server_failure.dart';
import '../../../../core/shared/extensions/exception_log.dart';
import '../../../user/data/data_sources/parse_user_datasource.dart';
import '../../../user/data/mappers/user_mapper.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../data_sources/parse_task_datasource.dart';
import '../mappers/task_mappers.dart';

class TaskRepositoryImpl implements TaskRepository {
  final _taskDatasource = Modular.get<ParseTaskDatasource>();
  final _userDatasource = Modular.get<ParseUserDatasource>();

  @override
  Future<Result<Unit, Failure>> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    String? campaignId,
    required String title,
    String? description,
  }) async {
    try {
      await _taskDatasource.create(
        ownerId: ownerId,
        assigneeId: assigneeId,
        relatedId: relatedId,
        campaignId: campaignId,
        title: title,
        description: description,
      );
    } on Exception catch (error) {
      error.logMessage('create() error', name: runtimeType.toString());
      return Result.error(ServerFailure.fromError(error));
    }

    return const Result.success(unit);
  }

  @override
  Future<Result<Unit, Failure>> delete(String id) async {
    try {
      await _taskDatasource.delete(id);
    } on Exception catch (error) {
      error.logMessage('delete() error', name: runtimeType.toString());
      return Result.error(ServerFailure.fromError(error));
    }

    return const Result.success(unit);
  }

  @override
  Future<Result<Task, Failure>> get(String id) async {
    late final ParseObject model;
    late final Task entity;
    try {
      model = await _taskDatasource.get(id);
      entity = await _convertTask(model);
    } on Exception catch (error) {
      error.logMessage('get() error', name: runtimeType.toString());
      return Result.error(ServerFailure.fromError(error));
    }

    return Result.success(entity);
  }

  @override
  Future<Result<List<Task>, Failure>> getTaskList({
    String? campaignId,
    bool? isDone,
    String? ownerUserId,
  }) async {
    late final List<ParseObject> modelList;
    late final List<Task> entityList;
    try {
      modelList = await _taskDatasource.getTaskList(
        campaignId: campaignId,
        isDone: isDone,
        ownerUserId: ownerUserId,
      );
      entityList = await _convertTaskList(modelList);
      entityList.sort(
        (a, b) => a.updatedAt.compareTo(b.updatedAt) * -1,
      );
    } on Exception catch (error) {
      error.logMessage('create() error', name: runtimeType.toString());
      return Result.error(ServerFailure.fromError(error));
    }

    return Result.success(entityList);
  }

  @override
  Future<Result<Unit, Failure>> update({
    required String id,
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    String? campaignId,
    required String state,
    DateTime? doneAt,
    required String title,
    String? description,
  }) async {
    try {
      await _taskDatasource.update(
        id: id,
        ownerId: ownerId,
        assigneeId: assigneeId,
        relatedId: relatedId,
        campaignId: campaignId,
        state: state,
        doneAt: doneAt,
        title: title,
        description: description,
      );
    } on Exception catch (error) {
      error.logMessage('update() error', name: runtimeType.toString());
      return Result.error(ServerFailure.fromError(error));
    }

    return const Result.success(unit);
  }

  Future<Task> _convertTask(ParseObject parseTask) async {
    final modelList = await _userDatasource.getAll();
    final userList = modelList.toUserList();
    final task = parseTask.toTask(userList);

    return task;
  }

  Future<List<Task>> _convertTaskList(List<ParseObject> parseTaskList) async {
    final modelList = await _userDatasource.getAll();
    final userList = modelList.toUserList();
    final taskList = parseTaskList.toTaskList(userList);

    return taskList;
  }
}
