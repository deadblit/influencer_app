import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/features/task/domain/use_cases/clear_tasks_filter.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../user/domain/entities/user.dart';
import '../../../../user/domain/usecases/get_all_users.dart';
import '../../../domain/entities/task_state.dart';
import '../../../domain/use_cases/load_tasks_filter.dart';
import '../../../domain/use_cases/save_tasks_filter.dart';

part 'task_filter_store.g.dart';

class TaskFilterStore = TaskFilterStoreBase with _$TaskFilterStore;

abstract class TaskFilterStoreBase with Store {
  TaskFilterStoreBase() {
    init();
  }

  @observable
  List<User> userList = [];

  @observable
  bool isLoading = false;

  @observable
  bool isFilterLoaded = false;

  @observable
  String? errorMessage;

  @observable
  int ownerUserIndex = -1;

  @observable
  bool isDone = false;

  @observable
  bool shouldCloseDialog = false;

  Future<void> init() async {
    await loadUsers();
    await loadFilters();
  }

  @action
  Future<void> loadFilters() async {
    final loadFilters = Modular.get<LoadTasksFilter>();
    isLoading = true;
    final result = await loadFilters(NoParams());
    isLoading = false;

    switch (result) {
      case Success():
        final taskFilter = result.success;

        if (taskFilter.ownerUserId == null) {
          ownerUserIndex = -1;
        } else {
          ownerUserIndex = userList.indexWhere(
            (element) => element.id == taskFilter.ownerUserId!,
          );
        }

        isDone = taskFilter.state == TaskState.done;
        errorMessage = null;
        isFilterLoaded = true;
        break;

      case Error():
        errorMessage = result.error.toString();
    }
  }

  @action
  Future<void> loadUsers() async {
    final getAllUsers = Modular.get<GetAllUsers>();
    isLoading = true;
    final result = await getAllUsers(NoParams());
    isLoading = false;

    switch (result) {
      case Success():
        userList = result.success;
        errorMessage = null;
        break;

      case Error():
        errorMessage = result.error.toString();
    }
  }

  @action
  Future<void> saveFilters() async {
    final saveFilter = Modular.get<SaveTasksFilter>();
    isLoading = true;

    final ownerUserId =
        ownerUserIndex == -1 ? null : userList[ownerUserIndex].id;

    final result = await saveFilter(SaveTasksFilterParams(
      ownerUserId: ownerUserId,
      isDone: isDone ? isDone : null,
    ));

    isLoading = false;

    switch (result) {
      case Success():
        errorMessage = null;
        shouldCloseDialog = true;
        break;

      case Error():
        errorMessage = result.error.toString();
    }
  }

  @action
  Future<void> clearFilters() async {
    final clearFilter = Modular.get<ClearTasksFilter>();
    isLoading = true;

    final result = await clearFilter(NoParams());

    isLoading = false;

    switch (result) {
      case Success():
        errorMessage = null;
        shouldCloseDialog = true;
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
