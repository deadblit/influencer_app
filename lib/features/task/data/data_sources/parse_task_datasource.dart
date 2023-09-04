import 'dart:developer';

import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:influencer_app/core/shared/extensions/exception_log.dart';

import '../../../../core/shared/extensions/parse_error_log.dart';
import '../../../../core/shared/extensions/parse_response_exception.dart';

class ParseTaskDatasource {
  Future<void> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String title,
    String? description,
  }) async {
    final task = ParseObject('Task')
      ..set('owner', ParseObject('_User')..objectId = ownerId)
      ..set('assignee', ParseObject('_User')..objectId = assigneeId)
      ..set('state', 'created')
      ..set('title', title)
      ..set('description', description);

    if (relatedId != null) {
      task.set('related', ParseObject('_User')..objectId = relatedId);
    }

    final response = await task.save();
    if (!response.success) {
      final error = response.getException();
      error.logMessage(
        "create task failed",
        name: runtimeType.toString(),
      );
      throw error;
    }
  }

  Future<void> delete(String id) async {
    final ParseResponse response;
    try {
      final task = ParseObject('Task')..set('objectId', id);

      response = await task.delete();
      if (!response.success) {
        response.error?.logMessage(
          "delete failed",
          name: runtimeType.toString(),
        );
        throw response.getException();
      }
    } on Exception catch (error) {
      log("delete failed", error: error, name: runtimeType.toString());
      rethrow;
    }
  }

  Future<ParseObject> get(String id) async {
    final ParseObject object;
    try {
      final task = ParseObject('Task')..set('objectId', id);

      object = await task.fetch();
    } on Exception catch (error) {
      log("get failed", error: error, name: runtimeType.toString());
      rethrow;
    }

    return object;
  }

  Future<List<ParseObject>> getAll() async {
    final ParseResponse response;
    try {
      response = await ParseObject('Task').getAll();
      if (!response.success) {
        response.error?.logMessage(
          "getAll failed",
          name: runtimeType.toString(),
        );
        throw response.getException();
      }
    } on Exception catch (error) {
      log("getAll failed", error: error, name: runtimeType.toString());
      rethrow;
    }

    final tasks = response.results?.cast<ParseObject>() ?? [];
    return tasks;
  }

  Future<void> update({
    required String id,
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String state,
    DateTime? doneAt,
    required String title,
    String? description,
  }) async {
    final ParseResponse response;
    try {
      final task = ParseObject('Task')
        ..set('objectId', id)
        ..set('owner', ParseObject('_User')..objectId = ownerId)
        ..set('assignee', ParseObject('_User')..objectId = assigneeId)
        ..set('related', ParseObject('_User')..objectId = relatedId)
        ..set('state', state)
        ..set('doneAt', doneAt)
        ..set('title', title)
        ..set('description', description);

      response = await task.save();
      if (!response.success) {
        response.error?.logMessage(
          "update failed",
          name: runtimeType.toString(),
        );
        throw response.getException();
      }
    } on Exception catch (error) {
      log("update failed", error: error, name: runtimeType.toString());
      rethrow;
    }
  }
}
