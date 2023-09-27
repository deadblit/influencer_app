// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_filtered_tasks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetFilteredTasksParams {
  String? get campaignId => throw _privateConstructorUsedError;
  bool? get isDone => throw _privateConstructorUsedError;
  String? get ownerUserId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetFilteredTasksParamsCopyWith<GetFilteredTasksParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFilteredTasksParamsCopyWith<$Res> {
  factory $GetFilteredTasksParamsCopyWith(GetFilteredTasksParams value,
          $Res Function(GetFilteredTasksParams) then) =
      _$GetFilteredTasksParamsCopyWithImpl<$Res, GetFilteredTasksParams>;
  @useResult
  $Res call({String? campaignId, bool? isDone, String? ownerUserId});
}

/// @nodoc
class _$GetFilteredTasksParamsCopyWithImpl<$Res,
        $Val extends GetFilteredTasksParams>
    implements $GetFilteredTasksParamsCopyWith<$Res> {
  _$GetFilteredTasksParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = freezed,
    Object? isDone = freezed,
    Object? ownerUserId = freezed,
  }) {
    return _then(_value.copyWith(
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDone: freezed == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      ownerUserId: freezed == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeleteTaskParamsCopyWith<$Res>
    implements $GetFilteredTasksParamsCopyWith<$Res> {
  factory _$$_DeleteTaskParamsCopyWith(
          _$_DeleteTaskParams value, $Res Function(_$_DeleteTaskParams) then) =
      __$$_DeleteTaskParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? campaignId, bool? isDone, String? ownerUserId});
}

/// @nodoc
class __$$_DeleteTaskParamsCopyWithImpl<$Res>
    extends _$GetFilteredTasksParamsCopyWithImpl<$Res, _$_DeleteTaskParams>
    implements _$$_DeleteTaskParamsCopyWith<$Res> {
  __$$_DeleteTaskParamsCopyWithImpl(
      _$_DeleteTaskParams _value, $Res Function(_$_DeleteTaskParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? campaignId = freezed,
    Object? isDone = freezed,
    Object? ownerUserId = freezed,
  }) {
    return _then(_$_DeleteTaskParams(
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
      isDone: freezed == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool?,
      ownerUserId: freezed == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_DeleteTaskParams implements _DeleteTaskParams {
  _$_DeleteTaskParams({this.campaignId, this.isDone, this.ownerUserId});

  @override
  final String? campaignId;
  @override
  final bool? isDone;
  @override
  final String? ownerUserId;

  @override
  String toString() {
    return 'GetFilteredTasksParams(campaignId: $campaignId, isDone: $isDone, ownerUserId: $ownerUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteTaskParams &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, campaignId, isDone, ownerUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteTaskParamsCopyWith<_$_DeleteTaskParams> get copyWith =>
      __$$_DeleteTaskParamsCopyWithImpl<_$_DeleteTaskParams>(this, _$identity);
}

abstract class _DeleteTaskParams implements GetFilteredTasksParams {
  factory _DeleteTaskParams(
      {final String? campaignId,
      final bool? isDone,
      final String? ownerUserId}) = _$_DeleteTaskParams;

  @override
  String? get campaignId;
  @override
  bool? get isDone;
  @override
  String? get ownerUserId;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteTaskParamsCopyWith<_$_DeleteTaskParams> get copyWith =>
      throw _privateConstructorUsedError;
}
