import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../entities/task_filter.dart';

abstract class TaskFilterRepository {
  Future<Result<TaskFilter, Failure>> load();
  Future<Result<Unit, Failure>> save(TaskFilter taskFilter);
  Future<Result<Unit, Failure>> clear();
}
