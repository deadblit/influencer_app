import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/task_repository.dart';

part 'create_task.freezed.dart';

class CreateTask extends Usecase<Unit, CreateTaskParams> {
  final TaskRepository taskRepository;

  CreateTask(this.taskRepository);

  @override
  Future<Result<Unit, Failure>> call(CreateTaskParams params) async {
    return await taskRepository.create(
      ownerId: params.ownerId,
      assigneeId: params.assigneeId,
      relatedId: params.relatedId,
      campaignId: params.campaignId,
      title: params.title,
      description: params.description,
      progress: params.progress,
    );
  }
}

@freezed
class CreateTaskParams with _$CreateTaskParams {
  factory CreateTaskParams({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    String? campaignId,
    required String title,
    String? description,
    required int progress,
  }) = _CreateTaskParams;
}
