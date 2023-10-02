import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task_filter.dart';
import '../entities/task_state.dart';
import '../repositories/task_filter_repository.dart';

part 'save_tasks_filter.freezed.dart';

class SaveTasksFilter extends Usecase<Unit, SaveTasksFilterParams> {
  final TaskFilterRepository taskFilterRepository;

  SaveTasksFilter(this.taskFilterRepository);

  @override
  Future<Result<Unit, Failure>> call(SaveTasksFilterParams params) async {
    final TaskState? taskState;

    if (params.isDone == true) {
      taskState = TaskState.done;
    } else {
      taskState = null;
    }

    return await taskFilterRepository.save(TaskFilter(
      ownerUserId: params.ownerUserId,
      campaignId: params.campaignId,
      state: taskState,
    ));
  }
}

@freezed
class SaveTasksFilterParams with _$SaveTasksFilterParams {
  factory SaveTasksFilterParams({
    String? campaignId,
    bool? isDone,
    String? ownerUserId,
  }) = _SaveTasksFilterParams;
}
