import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

part 'get_task.freezed.dart';

class GetTask extends Usecase<Task, GetTaskParams> {
  final TaskRepository taskRepository;

  GetTask(this.taskRepository);

  @override
  Future<Result<Task, Failure>> call(GetTaskParams params) async {
    final result = await taskRepository.get(params.id);

    switch (result) {
      case Success():
        return Result.success(result.success);

      case Error():
        return Result.error(result.error);
    }
  }
}

@freezed
class GetTaskParams with _$GetTaskParams {
  factory GetTaskParams({
    required String id,
  }) = _GetTaskParams;
}
