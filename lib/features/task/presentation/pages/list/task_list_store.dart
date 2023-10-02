import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/core/usecases/usecase.dart';
import 'package:influencer_app/features/task/domain/entities/task_filter.dart';
import 'package:influencer_app/features/task/domain/entities/task_state.dart';
import 'package:influencer_app/features/task/domain/use_cases/delete_task.dart';
import 'package:influencer_app/features/task/domain/use_cases/get_filtered_tasks.dart';
import 'package:influencer_app/features/task/domain/use_cases/load_tasks_filter.dart';

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

  @observable
  TaskFilter filter = const TaskFilter();

  @computed
  bool get isFiltered =>
      filter.ownerUserId != null || filter.state == TaskState.done;

  TaskListStoreBase();

  Future<void> load() async {
    await loadFilters();
    await getTasks();
  }

  @action
  Future<void> loadFilters() async {
    final loadFilters = Modular.get<LoadTasksFilter>();

    isLoading = true;
    final result = await loadFilters(NoParams());
    isLoading = false;

    switch (result) {
      case Success():
        errorMessage = null;
        filter = result.success;
        break;

      case Error():
        errorMessage = result.error.toString();
    }
  }

  @action
  Future<void> getTasks() async {
    final getFilteredTasks = Modular.get<GetFilteredTasks>();

    bool? done = (filter.state == null) ? null : filter.state == TaskState.done;

    isLoading = true;
    final result = await getFilteredTasks(GetFilteredTasksParams(
      ownerUserId: filter.ownerUserId,
      isDone: done,
    ));
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
