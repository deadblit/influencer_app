import 'dart:developer';

import 'package:multiple_result/multiple_result.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:influencer_app/core/shared/extensions/parse_error_log.dart';
import 'package:influencer_app/core/shared/extensions/parse_response_exception.dart';

class ParseUserDatasource {
  Future<Result<ParseObject, Exception>> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String title,
    String? description,
  }) async {
    throw UnimplementedError();
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
      response = await ParseObject('_User').getAll();
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
