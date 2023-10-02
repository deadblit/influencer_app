import 'package:multiple_result/multiple_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:influencer_app/core/failure/failure.dart';
import 'package:influencer_app/features/task/domain/entities/task_filter.dart';
import 'package:influencer_app/features/task/domain/entities/task_state.dart';
import 'package:influencer_app/features/task/domain/repositories/task_filter_repository.dart';

class TaskFilterRepositoryImpl implements TaskFilterRepository {
  final _ownerUserIdKey = 'ui/1.0/filter/ownerUserId';
  final _campaignIdKey = 'ui/1.0/filter/campaignId';
  final _taskStateKey = 'ui/1.0/filter/taskState';

  @override
  Future<Result<TaskFilter, Failure>> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final ownerUserId = prefs.getString(_ownerUserIdKey);
    final campaignId = prefs.getString(_campaignIdKey);
    final taskState = prefs.getString(_taskStateKey);
    final state = taskState == null ? null : TaskState.fromValue(taskState);

    return Result.success(TaskFilter(
      ownerUserId: ownerUserId,
      campaignId: campaignId,
      state: state,
    ));
  }

  @override
  Future<Result<Unit, Failure>> save(TaskFilter taskFilter) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (taskFilter.ownerUserId == null) {
      await prefs.remove(_ownerUserIdKey);
    } else {
      await prefs.setString(_ownerUserIdKey, taskFilter.ownerUserId!);
    }

    if (taskFilter.campaignId == null) {
      await prefs.remove(_campaignIdKey);
    } else {
      await prefs.setString(_campaignIdKey, taskFilter.campaignId!);
    }

    if (taskFilter.state == null) {
      await prefs.remove(_taskStateKey);
    } else {
      await prefs.setString(_taskStateKey, taskFilter.state!.value);
    }

    return const Result.success(unit);
  }

  @override
  Future<Result<Unit, Failure>> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(_ownerUserIdKey);
    await prefs.remove(_campaignIdKey);
    await prefs.remove(_taskStateKey);

    return const Result.success(unit);
  }
}
