import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  Future<Result<Task, Failure>> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String title,
    String? description,
  });

  Future<Result<Task?, Failure>> delete(String id);

  Future<Result<Task?, Failure>> get(String id);

  Future<Result<List<Task>, Failure>> getAll();

  Future<Result<Task?, Failure>> update({
    required String id,
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String state,
    DateTime? doneAt,
    required String title,
    String? description,
  });
}
