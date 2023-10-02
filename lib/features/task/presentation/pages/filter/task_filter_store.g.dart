// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskFilterStore on TaskFilterStoreBase, Store {
  late final _$userListAtom =
      Atom(name: 'TaskFilterStoreBase.userList', context: context);

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
      Atom(name: 'TaskFilterStoreBase.isLoading', context: context);

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

  late final _$isFilterLoadedAtom =
      Atom(name: 'TaskFilterStoreBase.isFilterLoaded', context: context);

  @override
  bool get isFilterLoaded {
    _$isFilterLoadedAtom.reportRead();
    return super.isFilterLoaded;
  }

  @override
  set isFilterLoaded(bool value) {
    _$isFilterLoadedAtom.reportWrite(value, super.isFilterLoaded, () {
      super.isFilterLoaded = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'TaskFilterStoreBase.errorMessage', context: context);

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

  late final _$ownerUserIndexAtom =
      Atom(name: 'TaskFilterStoreBase.ownerUserIndex', context: context);

  @override
  int get ownerUserIndex {
    _$ownerUserIndexAtom.reportRead();
    return super.ownerUserIndex;
  }

  @override
  set ownerUserIndex(int value) {
    _$ownerUserIndexAtom.reportWrite(value, super.ownerUserIndex, () {
      super.ownerUserIndex = value;
    });
  }

  late final _$isDoneAtom =
      Atom(name: 'TaskFilterStoreBase.isDone', context: context);

  @override
  bool get isDone {
    _$isDoneAtom.reportRead();
    return super.isDone;
  }

  @override
  set isDone(bool value) {
    _$isDoneAtom.reportWrite(value, super.isDone, () {
      super.isDone = value;
    });
  }

  late final _$shouldCloseDialogAtom =
      Atom(name: 'TaskFilterStoreBase.shouldCloseDialog', context: context);

  @override
  bool get shouldCloseDialog {
    _$shouldCloseDialogAtom.reportRead();
    return super.shouldCloseDialog;
  }

  @override
  set shouldCloseDialog(bool value) {
    _$shouldCloseDialogAtom.reportWrite(value, super.shouldCloseDialog, () {
      super.shouldCloseDialog = value;
    });
  }

  late final _$loadFiltersAsyncAction =
      AsyncAction('TaskFilterStoreBase.loadFilters', context: context);

  @override
  Future<void> loadFilters() {
    return _$loadFiltersAsyncAction.run(() => super.loadFilters());
  }

  late final _$loadUsersAsyncAction =
      AsyncAction('TaskFilterStoreBase.loadUsers', context: context);

  @override
  Future<void> loadUsers() {
    return _$loadUsersAsyncAction.run(() => super.loadUsers());
  }

  late final _$saveFiltersAsyncAction =
      AsyncAction('TaskFilterStoreBase.saveFilters', context: context);

  @override
  Future<void> saveFilters() {
    return _$saveFiltersAsyncAction.run(() => super.saveFilters());
  }

  late final _$clearFiltersAsyncAction =
      AsyncAction('TaskFilterStoreBase.clearFilters', context: context);

  @override
  Future<void> clearFilters() {
    return _$clearFiltersAsyncAction.run(() => super.clearFilters());
  }

  late final _$TaskFilterStoreBaseActionController =
      ActionController(name: 'TaskFilterStoreBase', context: context);

  @override
  void clearError() {
    final _$actionInfo = _$TaskFilterStoreBaseActionController.startAction(
        name: 'TaskFilterStoreBase.clearError');
    try {
      return super.clearError();
    } finally {
      _$TaskFilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userList: ${userList},
isLoading: ${isLoading},
isFilterLoaded: ${isFilterLoaded},
errorMessage: ${errorMessage},
ownerUserIndex: ${ownerUserIndex},
isDone: ${isDone},
shouldCloseDialog: ${shouldCloseDialog}
    ''';
  }
}
