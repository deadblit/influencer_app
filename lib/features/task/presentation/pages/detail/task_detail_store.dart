import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:influencer_app/core/usecases/usecase.dart';
import 'package:influencer_app/features/task/domain/entities/task_state.dart';
import 'package:influencer_app/features/task/domain/use_cases/create_task.dart';
import 'package:influencer_app/features/user/domain/entities/user.dart';
import 'package:influencer_app/features/user/domain/usecases/get_all_users.dart';

import '../../../../../core/shared/utils/string_utils.dart';
import '../../../domain/use_cases/get_task.dart';
import '../../../domain/use_cases/update_task.dart';

part 'task_detail_store.g.dart';

class TaskDetailStore = TaskDetailStoreBase with _$TaskDetailStore;

abstract class TaskDetailStoreBase with Store {
  TaskDetailStoreBase() {
    loadUsers();
  }

  @observable
  List<User> userList = [];

  @observable
  bool isLoading = false;

  @observable
  bool isTaskLoaded = false;

  @observable
  String? errorMessage;

  @observable
  bool shouldClosePage = false;

  @observable
  String? taskId;

  @observable
  int ownerIndex = -1;

  @observable
  int assigneeIndex = -1;

  @observable
  int relatedIndex = -1;

  @observable
  String? title;

  @observable
  String? description;

  @observable
  bool isDone = false;

  @observable
  TaskDetailErrorState error = TaskDetailErrorState();

  @computed
  bool get canSave => !error.hasErrors;

  @observable
  int statusIndex = -1;

  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => ownerIndex, validateOwnerIndex),
      reaction((_) => assigneeIndex, validateAssigneeIndex),
      reaction((_) => title, validateTitle)
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  List<String> get taskStateValues {
    return TaskState.values
        .map((state) => state.description.toString())
        .toList();
  }

  @action
  Future<void> loadTask() async {
    final getTask = Modular.get<GetTask>();
    isLoading = true;
    final result = await getTask(GetTaskParams(id: taskId!));
    isLoading = false;

    switch (result) {
      case Success():
        final task = result.success;

        ownerIndex = userList.indexOf(task.owner);
        assigneeIndex = userList.indexOf(task.assignee);
        relatedIndex =
            task.related == null ? -1 : userList.indexOf(task.related!);
        title = task.title;
        description = task.description;
        statusIndex = TaskState.values
            .firstWhere((element) => task.state == element)
            .index;
        errorMessage = null;
        isTaskLoaded = true;
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

        if (taskId == null) {
          final currentUser = await ParseUser.currentUser();
          final index = userList.indexWhere(
            (element) => element.username == currentUser?.username,
          );

          if (index > 0) {
            ownerIndex = index;
            assigneeIndex = index;
          }
        }

        break;

      case Error():
        errorMessage = result.error.toString();
    }
  }

  Future<void> save() {
    if (taskId == null) {
      return create();
    }

    return update();
  }

  @action
  Future<void> create() async {
    final createTask = Modular.get<CreateTask>();
    isLoading = true;

    final owner = userList[ownerIndex];
    final assignee = userList[assigneeIndex];
    final related = relatedIndex == -1 ? null : userList[ownerIndex];

    final result = await createTask(CreateTaskParams(
      ownerId: owner.id,
      assigneeId: assignee.id,
      relatedId: related?.id,
      title: title!,
      description: description,
    ));
    isLoading = false;

    switch (result) {
      case Success():
        errorMessage = null;
        shouldClosePage = true;
        break;

      case Error():
        errorMessage = result.error.toString();
    }
  }

  @action
  Future<void> update() async {
    final updateTask = Modular.get<UpdateTask>();
    isLoading = true;

    final owner = userList[ownerIndex];
    final assignee = userList[assigneeIndex];
    final related = relatedIndex == -1 ? null : userList[relatedIndex];
    final state =
        statusIndex == -1 ? TaskState.created : setStatus(statusIndex);

    final result = await updateTask(UpdateTaskParams(
      id: taskId!,
      ownerId: owner.id,
      assigneeId: assignee.id,
      relatedId: related?.id,
      title: title!,
      description: description,
      state: state,
      doneAt: state == TaskState.done ? DateTime.now() : null,
    ));

    isLoading = false;

    switch (result) {
      case Success():
        errorMessage = null;
        shouldClosePage = true;
        break;

      case Error():
        errorMessage = result.error.toString();
    }
  }

  TaskState setStatus(int index) {
    return TaskState.values[index];
  }

  @action
  void clearError() {
    errorMessage = null;
  }

  @action
  void validateOwnerIndex(int value) {
    error.owner = value < 0 ? 'Selecione o criador da tarefa' : null;
  }

  @action
  void validateAssigneeIndex(int value) {
    error.assignee = value < 0 ? 'Selecione o responsável pela tarefa' : null;
  }

  @action
  void validateTitle(String? value) {
    error.title =
        isEmptyOrNull(value) ? 'O título precisa ser preenchido' : null;
  }

  void validateAll() {
    validateOwnerIndex(ownerIndex);
    validateAssigneeIndex(assigneeIndex);
    validateTitle(title);

    if (canSave) {
      save();
    }
  }
}

class TaskDetailErrorState = TaskDetailErrorStateBase
    with _$TaskDetailErrorState;

abstract class TaskDetailErrorStateBase with Store {
  @observable
  String? owner;

  @observable
  String? assignee;

  @observable
  String? title;

  @computed
  bool get hasErrors => owner != null || assignee != null || title != null;
}
