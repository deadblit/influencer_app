// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskFilter _$$_TaskFilterFromJson(Map<String, dynamic> json) =>
    _$_TaskFilter(
      ownerUserId: json['ownerUserId'] as String?,
      campaignId: json['campaignId'] as String?,
      state: $enumDecodeNullable(_$TaskStateEnumMap, json['state']),
    );

Map<String, dynamic> _$$_TaskFilterToJson(_$_TaskFilter instance) =>
    <String, dynamic>{
      'ownerUserId': instance.ownerUserId,
      'campaignId': instance.campaignId,
      'state': _$TaskStateEnumMap[instance.state],
    };

const _$TaskStateEnumMap = {
  TaskState.created: 'created',
  TaskState.toDo: 'toDo',
  TaskState.inProgress: 'inProgress',
  TaskState.done: 'done',
  TaskState.cancelled: 'cancelled',
};
