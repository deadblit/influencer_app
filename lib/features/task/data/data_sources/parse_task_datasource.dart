import 'dart:developer';

import 'package:multiple_result/multiple_result.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:influencer_app/core/shared/extensions/parse_error_log.dart';
import 'package:influencer_app/core/shared/extensions/parse_response_exception.dart';

class ParseTaskDatasource {
  Future<Result<ParseObject, Exception>> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String title,
    String? description,
  }) async {
    final task = ParseObject('Task')
      ..set('owner', ParseObject('_User')..objectId = ownerId)
      ..set('assignee', ParseObject('_User')..objectId = assigneeId)
      ..set('related', ParseObject('_User')..objectId = relatedId)
      ..set('state', 'created')
      ..set('title', title)
      ..set('description', description);

    final response = await task.save();
    if (!response.success) {
      response.error?.logMessage(
        "create task failed",
        name: runtimeType.toString(),
      );
      return Result.error(response.getException());
    }

    final object = response.results?.first as ParseObject;

    return Result.success(object);
  }

  Future<Result<Unit, Exception>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  Future<Result<ParseObject, Exception>> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  Future<Result<List<ParseObject>, Exception>> getAll() async {
    final ParseResponse response;
    try {
      response = await ParseObject('Task').getAll();
    } on Exception catch (error) {
      log("getAll failed", error: error, name: runtimeType.toString());
      return Result.error(error);
    }

    final tasks = response.results?.cast<ParseObject>() ?? [];
    return Result.success(tasks);
  }

  Future<Result<ParseObject, Exception>> update({
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
}
