// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeleteTaskParams {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteTaskParamsCopyWith<DeleteTaskParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteTaskParamsCopyWith<$Res> {
  factory $DeleteTaskParamsCopyWith(
          DeleteTaskParams value, $Res Function(DeleteTaskParams) then) =
      _$DeleteTaskParamsCopyWithImpl<$Res, DeleteTaskParams>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$DeleteTaskParamsCopyWithImpl<$Res, $Val extends DeleteTaskParams>
    implements $DeleteTaskParamsCopyWith<$Res> {
  _$DeleteTaskParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$_DeleteTaskParamsCopyWith<$Res>
    implements $DeleteTaskParamsCopyWith<$Res> {
  factory _$$_DeleteTaskParamsCopyWith(
          _$_DeleteTaskParams value, $Res Function(_$_DeleteTaskParams) then) =
      __$$_DeleteTaskParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_DeleteTaskParamsCopyWithImpl<$Res>
    extends _$DeleteTaskParamsCopyWithImpl<$Res, _$_DeleteTaskParams>
    implements _$$_DeleteTaskParamsCopyWith<$Res> {
  __$$_DeleteTaskParamsCopyWithImpl(
      _$_DeleteTaskParams _value, $Res Function(_$_DeleteTaskParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_DeleteTaskParams(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteTaskParams implements _DeleteTaskParams {
  _$_DeleteTaskParams({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'DeleteTaskParams(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteTaskParams &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteTaskParamsCopyWith<_$_DeleteTaskParams> get copyWith =>
      __$$_DeleteTaskParamsCopyWithImpl<_$_DeleteTaskParams>(this, _$identity);
}

abstract class _DeleteTaskParams implements DeleteTaskParams {
  factory _DeleteTaskParams({required final String id}) = _$_DeleteTaskParams;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteTaskParamsCopyWith<_$_DeleteTaskParams> get copyWith =>
      throw _privateConstructorUsedError;
}
