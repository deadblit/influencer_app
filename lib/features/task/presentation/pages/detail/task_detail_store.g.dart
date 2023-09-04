// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskDetailStore on TaskDetailStoreBase, Store {
  Computed<bool>? _$canSaveComputed;

  @override
  bool get canSave => (_$canSaveComputed ??= Computed<bool>(() => super.canSave,
          name: 'TaskDetailStoreBase.canSave'))
      .value;

  late final _$userListAtom =
      Atom(name: 'TaskDetailStoreBase.userList', context: context);

  @override
  List<User> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<User> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'TaskDetailStoreBase.isLoading', context: context);

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
      Atom(name: 'TaskDetailStoreBase.errorMessage', context: context);

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

  late final _$shouldClosePageAtom =
      Atom(name: 'TaskDetailStoreBase.shouldClosePage', context: context);

  @override
  bool get shouldClosePage {
    _$shouldClosePageAtom.reportRead();
    return super.shouldClosePage;
  }

  @override
  set shouldClosePage(bool value) {
    _$shouldClosePageAtom.reportWrite(value, super.shouldClosePage, () {
      super.shouldClosePage = value;
    });
  }

  late final _$taskIdAtom =
      Atom(name: 'TaskDetailStoreBase.taskId', context: context);

  @override
  String? get taskId {
    _$taskIdAtom.reportRead();
    return super.taskId;
  }

  @override
  set taskId(String? value) {
    _$taskIdAtom.reportWrite(value, super.taskId, () {
      super.taskId = value;
    });
  }

  late final _$ownerIndexAtom =
      Atom(name: 'TaskDetailStoreBase.ownerIndex', context: context);

  @override
  int get ownerIndex {
    _$ownerIndexAtom.reportRead();
    return super.ownerIndex;
  }

  @override
  set ownerIndex(int value) {
    _$ownerIndexAtom.reportWrite(value, super.ownerIndex, () {
      super.ownerIndex = value;
    });
  }

  late final _$assigneeIndexAtom =
      Atom(name: 'TaskDetailStoreBase.assigneeIndex', context: context);

  @override
  int get assigneeIndex {
    _$assigneeIndexAtom.reportRead();
    return super.assigneeIndex;
  }

  @override
  set assigneeIndex(int value) {
    _$assigneeIndexAtom.reportWrite(value, super.assigneeIndex, () {
      super.assigneeIndex = value;
    });
  }

  late final _$relatedIndexAtom =
      Atom(name: 'TaskDetailStoreBase.relatedIndex', context: context);

  @override
  int get relatedIndex {
    _$relatedIndexAtom.reportRead();
    return super.relatedIndex;
  }

  @override
  set relatedIndex(int value) {
    _$relatedIndexAtom.reportWrite(value, super.relatedIndex, () {
      super.relatedIndex = value;
    });
  }

  late final _$titleAtom =
      Atom(name: 'TaskDetailStoreBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'TaskDetailStoreBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'TaskDetailStoreBase.error', context: context);

  @override
  TaskDetailErrorState get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(TaskDetailErrorState value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadTaskAsyncAction =
      AsyncAction('TaskDetailStoreBase.loadTask', context: context);

  @override
  Future<void> loadTask() {
    return _$loadTaskAsyncAction.run(() => super.loadTask());
  }

  late final _$loadUsersAsyncAction =
      AsyncAction('TaskDetailStoreBase.loadUsers', context: context);

  @override
  Future<void> loadUsers() {
    return _$loadUsersAsyncAction.run(() => super.loadUsers());
  }

  late final _$createAsyncAction =
      AsyncAction('TaskDetailStoreBase.create', context: context);

  @override
  Future<void> create() {
    return _$createAsyncAction.run(() => super.create());
  }

  late final _$updateAsyncAction =
      AsyncAction('TaskDetailStoreBase.update', context: context);

  @override
  Future<void> update() {
    return _$updateAsyncAction.run(() => super.update());
  }

  late final _$TaskDetailStoreBaseActionController =
      ActionController(name: 'TaskDetailStoreBase', context: context);

  @override
  void clearError() {
    final _$actionInfo = _$TaskDetailStoreBaseActionController.startAction(
        name: 'TaskDetailStoreBase.clearError');
    try {
      return super.clearError();
    } finally {
      _$TaskDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateOwnerIndex(int value) {
    final _$actionInfo = _$TaskDetailStoreBaseActionController.startAction(
        name: 'TaskDetailStoreBase.validateOwnerIndex');
    try {
      return super.validateOwnerIndex(value);
    } finally {
      _$TaskDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAssigneeIndex(int value) {
    final _$actionInfo = _$TaskDetailStoreBaseActionController.startAction(
        name: 'TaskDetailStoreBase.validateAssigneeIndex');
    try {
      return super.validateAssigneeIndex(value);
    } finally {
      _$TaskDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTitle(String? value) {
    final _$actionInfo = _$TaskDetailStoreBaseActionController.startAction(
        name: 'TaskDetailStoreBase.validateTitle');
    try {
      return super.validateTitle(value);
    } finally {
      _$TaskDetailStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userList: ${userList},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
shouldClosePage: ${shouldClosePage},
taskId: ${taskId},
ownerIndex: ${ownerIndex},
assigneeIndex: ${assigneeIndex},
relatedIndex: ${relatedIndex},
title: ${title},
description: ${description},
error: ${error},
canSave: ${canSave}
    ''';
  }
}

mixin _$TaskDetailErrorState on TaskDetailErrorStateBase, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: 'TaskDetailErrorStateBase.hasErrors'))
          .value;

  late final _$ownerAtom =
      Atom(name: 'TaskDetailErrorStateBase.owner', context: context);

  @override
  String? get owner {
    _$ownerAtom.reportRead();
    return super.owner;
  }

  @override
  set owner(String? value) {
    _$ownerAtom.reportWrite(value, super.owner, () {
      super.owner = value;
    });
  }

  late final _$assigneeAtom =
      Atom(name: 'TaskDetailErrorStateBase.assignee', context: context);

  @override
  String? get assignee {
    _$assigneeAtom.reportRead();
    return super.assignee;
  }

  @override
  set assignee(String? value) {
    _$assigneeAtom.reportWrite(value, super.assignee, () {
      super.assignee = value;
    });
  }

  late final _$titleAtom =
      Atom(name: 'TaskDetailErrorStateBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  @override
  String toString() {
    return '''
owner: ${owner},
assignee: ${assignee},
title: ${title},
hasErrors: ${hasErrors}
    ''';
  }
}
