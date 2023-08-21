// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      assignee: User.fromJson(json['assignee'] as Map<String, dynamic>),
      related: User.fromJson(json['related'] as Map<String, dynamic>),
      state: $enumDecode(_$TaskStateEnumMap, json['state']),
      doneAt: json['doneAt'] == null
          ? null
          : DateTime.parse(json['doneAt'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_TaskToJson(_$_Task instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'owner': instance.owner,
      'assignee': instance.assignee,
      'related': instance.related,
      'state': _$TaskStateEnumMap[instance.state]!,
      'doneAt': instance.doneAt?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
    };

const _$TaskStateEnumMap = {
  TaskState.created: 'created',
  TaskState.toDo: 'toDo',
  TaskState.inProgress: 'inProgress',
  TaskState.done: 'done',
  TaskState.cancelled: 'cancelled',
};
