import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/features/task/domain/entities/task.dart';

abstract class ITaskRepository {
  Future<Result<Task, Exception>> create({
    required String ownerId,
    required String assigneeId,
    String? relatedId,
    required String title,
    String? description,
  });

  Future<Result<Task?, Exception>> delete(String id);

  Future<Result<Task?, Exception>> get(String id);

  Future<Result<List<Task>, Exception>> getAll();

  Future<Result<Task?, Exception>> update({
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
