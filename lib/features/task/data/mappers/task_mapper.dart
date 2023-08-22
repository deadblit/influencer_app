import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../domain/entities/task.dart';

extension ToEntity on ParseObject {
  Task toTask() {
    final task = Task(
      id: get("objectId"),
      createdAt: get("createdAt"),
      updatedAt: get("updatedAt"),
      owner: get("owner"),
      assignee: get("assignee"),
      related: get("related"),
      state: get("state"),
      doneAt: get("doneAt"),
      title: get("title"),
      description: get("description"),
    );

    return task;
  }
}
