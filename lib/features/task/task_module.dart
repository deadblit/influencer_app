import 'package:flutter_modular/flutter_modular.dart';

import 'package:influencer_app/features/task/data/data_sources/parse_task_datasource.dart';
import 'package:influencer_app/features/task/data/repositories/parse_task_repository.dart';
import 'package:influencer_app/features/task/data/repositories/task_repository_interface.dart';
import 'package:influencer_app/features/task/presentation/pages/task_list_store.dart';
import 'package:influencer_app/features/user/data/data_sources/parse_user_datasource.dart';

import 'presentation/pages/task_detail_page.dart';
import 'presentation/pages/task_list_page.dart';

class TaskModule extends Module {
  @override
  void binds(Injector i) {
    i.add(ParseTaskDatasource.new);
    i.add(ParseUserDatasource.new);
    i.add<ITaskRepository>(ParseTaskRepository.new);
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
