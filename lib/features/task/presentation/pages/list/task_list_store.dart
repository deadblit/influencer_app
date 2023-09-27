import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/core/usecases/usecase.dart';
import 'package:influencer_app/features/task/domain/use_cases/delete_task.dart';
import 'package:influencer_app/features/task/domain/use_cases/get_filtered_tasks.dart';

import '../../../domain/entities/task.dart';

part 'task_list_store.g.dart';

class TaskListStore = TaskListStoreBase with _$TaskListStore;

abstract class TaskListStoreBase with Store {
  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  List<Task> taskList = [];

  TaskListStoreBase();

  @action
  Future<void> getAll() async {
    final getAllTasks = Modular.get<GetFilteredTasks>();
    isLoading = true;
    final result = await getAllTasks(NoParams());
    isLoading = false;

    switch (result) {
      case Success():
        errorMessage = null;
        taskList = result.success;
        break;

      case Error():
        errorMessage = result.error.toString();
    }
  }

  @action
  Future<void> delete(Task task) async {
    final deleteTask = Modular.get<DeleteTask>();
    isLoading = true;
    final result = await deleteTask(DeleteTaskParams(id: task.id));
    isLoading = false;

    switch (result) {
      case Success():
        errorMessage = null;

        final taskListCopy = List.of(taskList);
        taskListCopy.remove(task);
        taskList = taskListCopy;

        break;

      case Error():
        errorMessage = result.error.toString();
    }
  }

  @action
  void clearError() {
    errorMessage = null;
  }
}
