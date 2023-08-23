import 'dart:developer';

import 'package:parse_server_sdk/parse_server_sdk.dart';

class ParseUserDatasource {
  Future<ParseObject> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String title,
    String? description,
  }) async {
    throw UnimplementedError();
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
      response = await ParseObject('_User').getAll();
    } on Exception catch (error) {
      log("getAll failed", error: error, name: runtimeType.toString());
      rethrow;
    }

    final users = response.results?.cast<ParseObject>() ?? [];
    return users;
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
