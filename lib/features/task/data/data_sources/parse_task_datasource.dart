import 'dart:developer';

import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../../core/shared/extensions/parse_error_log.dart';
import '../../../../core/shared/extensions/parse_response_exception.dart';

class ParseTaskDatasource {
  Future<ParseObject> create({
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
      throw response.getException();
    }

    final object = response.results?.first as ParseObject;

    return object;
  }

  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  Future<ParseObject> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
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

  Future<ParseObject> update({
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
