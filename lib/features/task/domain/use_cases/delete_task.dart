import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/task_repository.dart';

part 'delete_task.freezed.dart';

class DeleteTask extends Usecase<Unit, DeleteTaskParams> {
  final TaskRepository taskRepository;

  DeleteTask(this.taskRepository);

  @override
  Future<Result<Unit, Failure>> call(DeleteTaskParams params) async {
    final result = await taskRepository.delete(params.id);

    switch (result) {
      case Success():
        return Result.success(result.success);

      case Error():
        return Result.error(result.error);
    }
  }
}

@freezed
class DeleteTaskParams with _$DeleteTaskParams {
  factory DeleteTaskParams({
    required String id,
  }) = _DeleteTaskParams;
}
