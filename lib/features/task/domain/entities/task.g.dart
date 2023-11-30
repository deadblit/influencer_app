// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Task _$$_TaskFromJson(Map<String, dynamic> json) => _$_Task(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      assignee: User.fromJson(json['assignee'] as Map<String, dynamic>),
      related: json['related'] == null
          ? null
          : User.fromJson(json['related'] as Map<String, dynamic>),
      state: $enumDecode(_$TaskStateEnumMap, json['state']),
      doneAt: json['doneAt'] == null
          ? null
          : DateTime.parse(json['doneAt'] as String),
      title: json['title'] as String,
      description: json['description'] as String?,
      progress: json['progress'] as int?,
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
      'progress': instance.progress,
    };

const _$TaskStateEnumMap = {
  TaskState.created: 'created',
  TaskState.toDo: 'toDo',
  TaskState.inProgress: 'inProgress',
  TaskState.done: 'done',
  TaskState.cancelled: 'cancelled',
};
