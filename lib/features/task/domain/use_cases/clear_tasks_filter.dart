import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/task_filter_repository.dart';

class ClearTasksFilter extends Usecase<Unit, NoParams> {
  final TaskFilterRepository taskFilterRepository;

  ClearTasksFilter(this.taskFilterRepository);

  @override
  Future<Result<Unit, Failure>> call(NoParams params) async {
    return await taskFilterRepository.clear();
  }
}
