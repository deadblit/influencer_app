// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListStore on TaskListStoreBase, Store {
  Computed<bool>? _$isFilteredComputed;

  @override
  bool get isFiltered =>
      (_$isFilteredComputed ??= Computed<bool>(() => super.isFiltered,
              name: 'TaskListStoreBase.isFiltered'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'TaskListStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'TaskListStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$taskListAtom =
      Atom(name: 'TaskListStoreBase.taskList', context: context);

  @override
  List<Task> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(List<Task> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$filterAtom =
      Atom(name: 'TaskListStoreBase.filter', context: context);

  @override
  TaskFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(TaskFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$loadFiltersAsyncAction =
      AsyncAction('TaskListStoreBase.loadFilters', context: context);

  @override
  Future<void> loadFilters() {
    return _$loadFiltersAsyncAction.run(() => super.loadFilters());
  }

  late final _$getTasksAsyncAction =
      AsyncAction('TaskListStoreBase.getTasks', context: context);

  @override
  Future<void> getTasks() {
    return _$getTasksAsyncAction.run(() => super.getTasks());
  }

  late final _$deleteAsyncAction =
      AsyncAction('TaskListStoreBase.delete', context: context);

  @override
  Future<void> delete(Task task) {
    return _$deleteAsyncAction.run(() => super.delete(task));
  }

  late final _$TaskListStoreBaseActionController =
      ActionController(name: 'TaskListStoreBase', context: context);

  @override
  void clearError() {
    final _$actionInfo = _$TaskListStoreBaseActionController.startAction(
        name: 'TaskListStoreBase.clearError');
    try {
      return super.clearError();
    } finally {
      _$TaskListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
taskList: ${taskList},
filter: ${filter},
isFiltered: ${isFiltered}
    ''';
  }
}
