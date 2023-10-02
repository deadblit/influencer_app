import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task_filter.dart';
import '../repositories/task_filter_repository.dart';

class LoadTasksFilter extends Usecase<TaskFilter, NoParams> {
  final TaskFilterRepository taskFilterRepository;

  LoadTasksFilter(this.taskFilterRepository);

  @override
  Future<Result<TaskFilter, Failure>> call(NoParams params) async {
    return await taskFilterRepository.load();
  }
}
