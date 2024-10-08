import 'dart:developer';

import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../core/shared/extensions/parse_response_exception.dart';

class ParseTaskDatasource {
  Future<void> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    String? campaignId,
    required String title,
    String? description,
    required progress,
  }) async {
    final task = ParseObject('Task')
      ..set('ownerId', ownerId)
      ..set('assigneeId', assigneeId)
      ..set('state', 'created')
      ..set('title', title)
      ..set('description', description)
      ..set('progress', progress);

    if (relatedId != null) {
      task.set('relatedId', relatedId);
    }

    if (campaignId != null) {
      task.set('campaign', ParseObject('Campaign')..objectId = campaignId);
    }

    final response = await task.save();
    response.throwOnFailure(
      "create task failed",
      runtimeType.toString(),
    );
  }

  Future<void> delete(String id) async {
    final ParseResponse response;
    try {
      final task = ParseObject('Task')..set('objectId', id);

      response = await task.delete();
      response.throwOnFailure(
        "delete task failed",
        runtimeType.toString(),
      );
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

  Future<List<ParseObject>> getTaskList({
    String? campaignId,
    bool? isDone,
    String? ownerUserId,
  }) async {
    final ParseResponse response;
    final taskClass = ParseObject('Task');

    try {
      final queryBuilder = QueryBuilder<ParseObject>(taskClass);

      if (campaignId != null) {
        queryBuilder.whereEqualTo(
            'campaign', ParseObject('Campaign')..objectId = campaignId);
      }

      if (isDone != null) {
        queryBuilder.whereValueExists('doneAt', isDone);
      }

      if (ownerUserId != null) {
        queryBuilder.whereEqualTo('ownerId', ownerUserId);
      }

      response = await queryBuilder.query();
      response.throwOnFailure(
        "get all tasks failed",
        runtimeType.toString(),
      );
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
    String? campaignId,
    required String state,
    DateTime? doneAt,
    required String title,
    String? description,
    int? progress,
  }) async {
    final ParseResponse response;
    try {
      final task = ParseObject('Task')
        ..set('objectId', id)
        ..set('ownerId', ownerId)
        ..set('assigneeId', assigneeId)
        ..set('state', state)
        ..set('doneAt', doneAt)
        ..set('title', title)
        ..set('description', description);

      if (relatedId != null) {
        task.set('relatedId', relatedId);
      }

      if (campaignId != null) {
        task.set('campaign', ParseObject('Campaign')..objectId = campaignId);
      }
      if (progress != null) {
        task.set('progress', progress);
      }

      response = await task.save();
      response.throwOnFailure(
        "update task failed",
        runtimeType.toString(),
      );
    } on Exception catch (error) {
      log("update failed", error: error, name: runtimeType.toString());
      rethrow;
    }
  }
}
