import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/features/task/domain/entities/task_state.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/task_repository.dart';

part 'update_task.freezed.dart';

class UpdateTask extends Usecase<Unit, UpdateTaskParams> {
  final TaskRepository taskRepository;

  UpdateTask(this.taskRepository);

  @override
  Future<Result<Unit, Failure>> call(UpdateTaskParams params) async {
    return await taskRepository.update(
      id: params.id,
      ownerId: params.ownerId,
      assigneeId: params.assigneeId,
      relatedId: params.relatedId,
      campaignId: params.campaignId,
      title: params.title,
      description: params.description,
      state: params.state.value,
      doneAt: params.doneAt,
    );
  }
}

@freezed
class UpdateTaskParams with _$UpdateTaskParams {
  factory UpdateTaskParams({
    required String id,
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    String? campaignId,
    required String title,
    String? description,
    required TaskState state,
    DateTime? doneAt,
  }) = _UpdateTaskParams;
}
