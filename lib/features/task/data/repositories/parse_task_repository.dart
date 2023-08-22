import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:influencer_app/core/shared/extensions/parse_error_log.dart';
import 'package:influencer_app/core/shared/extensions/parse_response_exception.dart';
import 'package:influencer_app/features/task/data/data_sources/parse_task_datasource.dart';
import 'package:influencer_app/features/task/data/mappers/task_mapper.dart';
import 'package:influencer_app/features/task/data/repositories/task_repository_interface.dart';
import 'package:influencer_app/features/task/domain/entities/task.dart';
import 'package:influencer_app/features/task/domain/entities/task_state.dart';
import 'package:influencer_app/features/user/data/mappers/user_mapper.dart';

import '../../../user/data/data_sources/parse_user_datasource.dart';
import '../../../user/domain/entities/user.dart';

class ParseTaskRepository implements ITaskRepository {
  final _taskDatasource = Modular.get<ParseTaskDatasource>();
  final _userDatasource = Modular.get<ParseUserDatasource>();

  @override
  Future<Result<Task, Exception>> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String title,
    String? description,
  }) async {
    final taskResult = await _taskDatasource.create(
      ownerId: ownerId,
      assigneeId: assigneeId,
      relatedId: relatedId,
      title: title,
      description: description,
    );

    switch (taskResult) {
      case Success():
        final task = await _convertTask(taskResult.success);
        return Result.success(task);

      case Error():
        return Result.error(taskResult.error);
    }
  }

  @override
  Future<Result<Task?, Exception>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<Task?, Exception>> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Task>, Exception>> getAll() async {
    final ParseResponse tasks;

    try {
      tasks = await ParseObject('Task').getAll();
    } on Exception catch (error) {
      log("getAll failed", error: error, name: runtimeType.toString());
      return Result.error(error);
    }

    final taskList = await _convertTaskList(tasks.results as List<ParseObject>);

    return Result.success(taskList);
  }

  @override
  Future<Result<Task?, Exception>> update({
    required String id,
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String state,
    DateTime? doneAt,
    required String title,
    String? description,
  }) {
    // TODO: implement update
    throw UnimplementedError();
  }

  Future<Task> _convertTask(ParseObject parseTask) async {
    final result = await _userDatasource.getAll();

    switch (result) {
      case Success():
        final userList = result.success.map((e) => e.toUser()).toList();

        return _mapTask(userList, parseTask);

      case Error():
        throw (result.error);
    }
  }

  Future<List<Task>> _convertTaskList(List<ParseObject> parseTaskList) async {
    final result = await _userDatasource.getAll();

    switch (result) {
      case Success():
        final userList = result.success.map((e) => e.toUser()).toList();
        final taskList =
            parseTaskList.map((e) => _mapTask(userList, e)).toList();

        return taskList;

      case Error():
        throw (result.error);
    }
  }

  Task _mapTask(List<User> userList, ParseObject parseTask) {
    final owner = userList
        .where((element) => element.id == parseTask.get("owner").objectId)
        .firstOrNull;
    final assignee = userList
        .where((element) => element.id == parseTask.get("assignee").objectId)
        .firstOrNull;
    final related = userList
        .where((element) => element.id == parseTask.get("related")?.objectId)
        .firstOrNull;

    final task = Task(
      id: parseTask.get("objectId"),
      createdAt: parseTask.get("createdAt"),
      updatedAt: parseTask.get("updatedAt"),
      owner: owner!,
      assignee: assignee!,
      related: related,
      state: TaskState.fromValue(parseTask.get("state")),
      doneAt: parseTask.get("doneAt"),
      title: parseTask.get("title"),
      description: parseTask.get("description"),
    );

    return task;
  }
}
