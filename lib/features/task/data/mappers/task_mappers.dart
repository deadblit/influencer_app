import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../user/domain/entities/user.dart';
import '../../domain/entities/task.dart';
import '../../domain/entities/task_state.dart';

extension ObjectMapper on ParseObject {
  Task toTask(List<User> userList) {
    final owner =
        userList.where((e) => e.id == get("owner").objectId).firstOrNull;
    final assignee =
        userList.where((e) => e.id == get("assignee").objectId).firstOrNull;
    final related =
        userList.where((e) => e.id == get("related")?.objectId).firstOrNull;

    final task = Task(
      id: objectId!,
      createdAt: createdAt!,
      updatedAt: updatedAt!,
      owner: owner!,
      assignee: assignee!,
      related: related,
      state: TaskState.fromValue(get("state")),
      doneAt: get("doneAt"),
      title: get("title"),
      description: get("description"),
    );

    return task;
  }
}

extension ListMapper on List<ParseObject> {
  List<Task> toTaskList(List<User> userList) {
    final taskList = map((e) => e.toTask(userList)).toList();

    return taskList;
  }
}
