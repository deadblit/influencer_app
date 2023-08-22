// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  User get owner => throw _privateConstructorUsedError;
  User get assignee => throw _privateConstructorUsedError;
  User? get related => throw _privateConstructorUsedError;
  TaskState get state => throw _privateConstructorUsedError;
  DateTime? get doneAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      User owner,
      User assignee,
      User? related,
      TaskState state,
      DateTime? doneAt,
      String title,
      String? description});

  $UserCopyWith<$Res> get owner;
  $UserCopyWith<$Res> get assignee;
  $UserCopyWith<$Res>? get related;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? owner = null,
    Object? assignee = null,
    Object? related = freezed,
    Object? state = null,
    Object? doneAt = freezed,
    Object? title = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      assignee: null == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as User,
      related: freezed == related
          ? _value.related
          : related // ignore: cast_nullable_to_non_nullable
              as User?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TaskState,
      doneAt: freezed == doneAt
          ? _value.doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get owner {
    return $UserCopyWith<$Res>(_value.owner, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get assignee {
    return $UserCopyWith<$Res>(_value.assignee, (value) {
      return _then(_value.copyWith(assignee: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get related {
    if (_value.related == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.related!, (value) {
      return _then(_value.copyWith(related: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime createdAt,
      DateTime updatedAt,
      User owner,
      User assignee,
      User? related,
      TaskState state,
      DateTime? doneAt,
      String title,
      String? description});

  @override
  $UserCopyWith<$Res> get owner;
  @override
  $UserCopyWith<$Res> get assignee;
  @override
  $UserCopyWith<$Res>? get related;
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? owner = null,
    Object? assignee = null,
    Object? related = freezed,
    Object? state = null,
    Object? doneAt = freezed,
    Object? title = null,
    Object? description = freezed,
  }) {
    return _then(_$_Task(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as User,
      assignee: null == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as User,
      related: freezed == related
          ? _value.related
          : related // ignore: cast_nullable_to_non_nullable
              as User?,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as TaskState,
      doneAt: freezed == doneAt
          ? _value.doneAt
          : doneAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task implements _Task {
  const _$_Task(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.owner,
      required this.assignee,
      this.related,
      required this.state,
      this.doneAt,
      required this.title,
      this.description});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final String id;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final User owner;
  @override
  final User assignee;
  @override
  final User? related;
  @override
  final TaskState state;
  @override
  final DateTime? doneAt;
  @override
  final String title;
  @override
  final String? description;

  @override
  String toString() {
    return 'Task(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, owner: $owner, assignee: $assignee, related: $related, state: $state, doneAt: $doneAt, title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee) &&
            (identical(other.related, related) || other.related == related) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.doneAt, doneAt) || other.doneAt == doneAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, updatedAt, owner,
      assignee, related, state, doneAt, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {required final String id,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      required final User owner,
      required final User assignee,
      final User? related,
      required final TaskState state,
      final DateTime? doneAt,
      required final String title,
      final String? description}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String get id;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  User get owner;
  @override
  User get assignee;
  @override
  User? get related;
  @override
  TaskState get state;
  @override
  DateTime? get doneAt;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
