import 'package:freezed_annotation/freezed_annotation.dart';

import 'task_state.dart';

part 'task_filter.freezed.dart';
part 'task_filter.g.dart';

@freezed
class TaskFilter with _$TaskFilter {
  const factory TaskFilter({
    String? ownerUserId,
    String? campaignId,
    TaskState? state,
  }) = _TaskFilter;

  factory TaskFilter.fromJson(Map<String, Object?> json) =>
      _$TaskFilterFromJson(json);
}
