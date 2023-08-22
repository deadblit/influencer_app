import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/features/task/domain/entities/task.dart';

import '../../data/repositories/task_repository_interface.dart';

part 'task_list_store.g.dart';

class TaskListStore = TaskListStoreBase with _$TaskListStore;

abstract class TaskListStoreBase with Store {
  final ITaskRepository repository;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  List<Task> taskList = [];

  TaskListStoreBase(this.repository);

  @action
  Future<void> getAll() async {
    isLoading = true;
    final result = await repository.getAll();
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
  void clearError() {
    errorMessage = null;
  }
}
