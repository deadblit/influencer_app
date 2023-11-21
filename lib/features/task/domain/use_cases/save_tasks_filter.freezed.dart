// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_tasks_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SaveTasksFilterParams {
  String? get campaignId => throw _privateConstructorUsedError;
  TaskState? get taskState => throw _privateConstructorUsedError;
  String? get ownerUserId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SaveTasksFilterParamsCopyWith<SaveTasksFilterParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveTasksFilterParamsCopyWith<$Res> {
  factory $SaveTasksFilterParamsCopyWith(SaveTasksFilterParams value,
          $Res Function(SaveTasksFilterParams) then) =
      _$SaveTasksFilterParamsCopyWithImpl<$Res, SaveTasksFilterParams>;
  @useResult
  $Res call({String? campaignId, TaskState? taskState, String? ownerUserId});
}

/// @nodoc
class _$SaveTasksFilterParamsCopyWithImpl<$Res,
        $Val extends SaveTasksFilterParams>
    implements $SaveTasksFilterParamsCopyWith<$Res> {
  _$SaveTasksFilterParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = freezed,
    Object? taskState = freezed,
    Object? ownerUserId = freezed,
  }) {
    return _then(_value.copyWith(
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
      taskState: freezed == taskState
          ? _value.taskState
          : taskState // ignore: cast_nullable_to_non_nullable
              as TaskState?,
      ownerUserId: freezed == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaveTasksFilterParamsCopyWith<$Res>
    implements $SaveTasksFilterParamsCopyWith<$Res> {
  factory _$$_SaveTasksFilterParamsCopyWith(_$_SaveTasksFilterParams value,
          $Res Function(_$_SaveTasksFilterParams) then) =
      __$$_SaveTasksFilterParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? campaignId, TaskState? taskState, String? ownerUserId});
}

/// @nodoc
class __$$_SaveTasksFilterParamsCopyWithImpl<$Res>
    extends _$SaveTasksFilterParamsCopyWithImpl<$Res, _$_SaveTasksFilterParams>
    implements _$$_SaveTasksFilterParamsCopyWith<$Res> {
  __$$_SaveTasksFilterParamsCopyWithImpl(_$_SaveTasksFilterParams _value,
      $Res Function(_$_SaveTasksFilterParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = freezed,
    Object? taskState = freezed,
    Object? ownerUserId = freezed,
  }) {
    return _then(_$_SaveTasksFilterParams(
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
      taskState: freezed == taskState
          ? _value.taskState
          : taskState // ignore: cast_nullable_to_non_nullable
              as TaskState?,
      ownerUserId: freezed == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SaveTasksFilterParams implements _SaveTasksFilterParams {
  _$_SaveTasksFilterParams({this.campaignId, this.taskState, this.ownerUserId});

  @override
  final String? campaignId;
  @override
  final TaskState? taskState;
  @override
  final String? ownerUserId;

  @override
  String toString() {
    return 'SaveTasksFilterParams(campaignId: $campaignId, taskState: $taskState, ownerUserId: $ownerUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaveTasksFilterParams &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.taskState, taskState) ||
                other.taskState == taskState) &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, campaignId, taskState, ownerUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveTasksFilterParamsCopyWith<_$_SaveTasksFilterParams> get copyWith =>
      __$$_SaveTasksFilterParamsCopyWithImpl<_$_SaveTasksFilterParams>(
          this, _$identity);
}

abstract class _SaveTasksFilterParams implements SaveTasksFilterParams {
  factory _SaveTasksFilterParams(
      {final String? campaignId,
      final TaskState? taskState,
      final String? ownerUserId}) = _$_SaveTasksFilterParams;

  @override
  String? get campaignId;
  @override
  TaskState? get taskState;
  @override
  String? get ownerUserId;
  @override
  @JsonKey(ignore: true)
  _$$_SaveTasksFilterParamsCopyWith<_$_SaveTasksFilterParams> get copyWith =>
      throw _privateConstructorUsedError;
}
