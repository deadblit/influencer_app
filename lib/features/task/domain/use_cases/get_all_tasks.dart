import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetAllTasks extends Usecase<List<Task>, NoParams> {
  final TaskRepository taskRepository;

  GetAllTasks(this.taskRepository);

  @override
  Future<Result<List<Task>, Failure>> call(NoParams params) async {
    return await taskRepository.getAll();
  }
}
