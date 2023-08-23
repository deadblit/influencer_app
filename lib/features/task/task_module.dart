import 'package:flutter_modular/flutter_modular.dart';

import 'package:influencer_app/features/task/domain/use_cases/get_all_tasks.dart';

import '../user/data/data_sources/parse_user_datasource.dart';

import 'data/data_sources/parse_task_datasource.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/repositories/task_repository.dart';
import 'presentation/pages/task_detail_page.dart';
import 'presentation/pages/task_list_page.dart';
import 'presentation/pages/task_list_store.dart';

class TaskModule extends Module {
  @override
  void binds(Injector i) {
    i.add(ParseTaskDatasource.new);
    i.add(ParseUserDatasource.new);
    i.add<TaskRepository>(TaskRepositoryImpl.new);
    i.add(GetAllTasks.new);
    i.add(TaskListStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => TaskListPage(),
      transition: TransitionType.noTransition,
    );
    r.child('/:id', child: (context) => const TaskDetailPage());
  }
}
