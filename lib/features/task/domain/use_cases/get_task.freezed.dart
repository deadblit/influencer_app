// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetTaskParams {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetTaskParamsCopyWith<GetTaskParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTaskParamsCopyWith<$Res> {
  factory $GetTaskParamsCopyWith(
          GetTaskParams value, $Res Function(GetTaskParams) then) =
      _$GetTaskParamsCopyWithImpl<$Res, GetTaskParams>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$GetTaskParamsCopyWithImpl<$Res, $Val extends GetTaskParams>
    implements $GetTaskParamsCopyWith<$Res> {
  _$GetTaskParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetTaskParamsCopyWith<$Res>
    implements $GetTaskParamsCopyWith<$Res> {
  factory _$$_GetTaskParamsCopyWith(
          _$_GetTaskParams value, $Res Function(_$_GetTaskParams) then) =
      __$$_GetTaskParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_GetTaskParamsCopyWithImpl<$Res>
    extends _$GetTaskParamsCopyWithImpl<$Res, _$_GetTaskParams>
    implements _$$_GetTaskParamsCopyWith<$Res> {
  __$$_GetTaskParamsCopyWithImpl(
      _$_GetTaskParams _value, $Res Function(_$_GetTaskParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_GetTaskParams(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetTaskParams implements _GetTaskParams {
  _$_GetTaskParams({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'GetTaskParams(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetTaskParams &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetTaskParamsCopyWith<_$_GetTaskParams> get copyWith =>
      __$$_GetTaskParamsCopyWithImpl<_$_GetTaskParams>(this, _$identity);
}

abstract class _GetTaskParams implements GetTaskParams {
  factory _GetTaskParams({required final String id}) = _$_GetTaskParams;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_GetTaskParamsCopyWith<_$_GetTaskParams> get copyWith =>
      throw _privateConstructorUsedError;
}
