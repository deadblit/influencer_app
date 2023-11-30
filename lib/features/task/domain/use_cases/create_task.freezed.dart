// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateTaskParams {
  String get ownerId => throw _privateConstructorUsedError;
  String get assigneeId => throw _privateConstructorUsedError;
  String? get relatedId => throw _privateConstructorUsedError;
  String? get campaignId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateTaskParamsCopyWith<CreateTaskParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTaskParamsCopyWith<$Res> {
  factory $CreateTaskParamsCopyWith(
          CreateTaskParams value, $Res Function(CreateTaskParams) then) =
      _$CreateTaskParamsCopyWithImpl<$Res, CreateTaskParams>;
  @useResult
  $Res call(
      {String ownerId,
      String assigneeId,
      String? relatedId,
      String? campaignId,
      String title,
      String? description,
      int progress});
}

/// @nodoc
class _$CreateTaskParamsCopyWithImpl<$Res, $Val extends CreateTaskParams>
    implements $CreateTaskParamsCopyWith<$Res> {
  _$CreateTaskParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? assigneeId = null,
    Object? relatedId = freezed,
    Object? campaignId = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? progress = null,
  }) {
    return _then(_value.copyWith(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      assigneeId: null == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as String,
      relatedId: freezed == relatedId
          ? _value.relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateTaskParamsCopyWith<$Res>
    implements $CreateTaskParamsCopyWith<$Res> {
  factory _$$_CreateTaskParamsCopyWith(
          _$_CreateTaskParams value, $Res Function(_$_CreateTaskParams) then) =
      __$$_CreateTaskParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ownerId,
      String assigneeId,
      String? relatedId,
      String? campaignId,
      String title,
      String? description,
      int progress});
}

/// @nodoc
class __$$_CreateTaskParamsCopyWithImpl<$Res>
    extends _$CreateTaskParamsCopyWithImpl<$Res, _$_CreateTaskParams>
    implements _$$_CreateTaskParamsCopyWith<$Res> {
  __$$_CreateTaskParamsCopyWithImpl(
      _$_CreateTaskParams _value, $Res Function(_$_CreateTaskParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownerId = null,
    Object? assigneeId = null,
    Object? relatedId = freezed,
    Object? campaignId = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? progress = null,
  }) {
    return _then(_$_CreateTaskParams(
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      assigneeId: null == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as String,
      relatedId: freezed == relatedId
          ? _value.relatedId
          : relatedId // ignore: cast_nullable_to_non_nullable
              as String?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CreateTaskParams implements _CreateTaskParams {
  _$_CreateTaskParams(
      {required this.ownerId,
      required this.assigneeId,
      this.relatedId,
      this.campaignId,
      required this.title,
      this.description,
      required this.progress});

  @override
  final String ownerId;
  @override
  final String assigneeId;
  @override
  final String? relatedId;
  @override
  final String? campaignId;
  @override
  final String title;
  @override
  final String? description;
  @override
  final int progress;

  @override
  String toString() {
    return 'CreateTaskParams(ownerId: $ownerId, assigneeId: $assigneeId, relatedId: $relatedId, campaignId: $campaignId, title: $title, description: $description, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateTaskParams &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.assigneeId, assigneeId) ||
                other.assigneeId == assigneeId) &&
            (identical(other.relatedId, relatedId) ||
                other.relatedId == relatedId) &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ownerId, assigneeId, relatedId,
      campaignId, title, description, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateTaskParamsCopyWith<_$_CreateTaskParams> get copyWith =>
      __$$_CreateTaskParamsCopyWithImpl<_$_CreateTaskParams>(this, _$identity);
}

abstract class _CreateTaskParams implements CreateTaskParams {
  factory _CreateTaskParams(
      {required final String ownerId,
      required final String assigneeId,
      final String? relatedId,
      final String? campaignId,
      required final String title,
      final String? description,
      required final int progress}) = _$_CreateTaskParams;

  @override
  String get ownerId;
  @override
  String get assigneeId;
  @override
  String? get relatedId;
  @override
  String? get campaignId;
  @override
  String get title;
  @override
  String? get description;
  @override
  int get progress;
  @override
  @JsonKey(ignore: true)
  _$$_CreateTaskParamsCopyWith<_$_CreateTaskParams> get copyWith =>
      throw _privateConstructorUsedError;
}
