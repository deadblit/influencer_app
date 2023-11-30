import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../user/domain/entities/user.dart';

import 'task_state.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    required User owner,
    required User assignee,
    User? related,
    required TaskState state,
    DateTime? doneAt,
    required String title,
    String? description,
    required int? progress
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}
