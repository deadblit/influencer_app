import 'package:multiple_result/multiple_result.dart';

import '../../../../core/failure/failure.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  Future<Result<Unit, Failure>> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    String? campaignId,
    required String title,
    String? description,
    required int progress,
  });

  Future<Result<Unit, Failure>> delete(String id);

  Future<Result<Task, Failure>> get(String id);

  Future<Result<List<Task>, Failure>> getTaskList({
    String? campaignId,
    bool? isDone,
    String? ownerUserId,
  });

  Future<Result<Unit, Failure>> update({
    required String id,
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    String? campaignId,
    required String state,
    DateTime? doneAt,
    required String title,
    String? description,
    int? progress
  });
}
