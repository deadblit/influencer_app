import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

part 'get_filtered_tasks.freezed.dart';

class GetFilteredTasks extends Usecase<List<Task>, GetFilteredTasksParams> {
  final TaskRepository taskRepository;

  GetFilteredTasks(this.taskRepository);

  @override
  Future<Result<List<Task>, Failure>> call(
      GetFilteredTasksParams params) async {
    return await taskRepository.getTaskList(
      campaignId: params.campaignId,
      isDone: params.isDone,
      ownerUserId: params.ownerUserId,
    );
  }
}

@freezed
class GetFilteredTasksParams with _$GetFilteredTasksParams {
  factory GetFilteredTasksParams({
    String? campaignId,
    bool? isDone,
    String? ownerUserId,
  }) = _DeleteTaskParams;
}
