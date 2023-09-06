import 'package:flutter_modular/flutter_modular.dart';

import 'package:influencer_app/features/task/domain/use_cases/create_task.dart';
import 'package:influencer_app/features/task/domain/use_cases/delete_task.dart';
import 'package:influencer_app/features/task/domain/use_cases/get_all_tasks.dart';
import 'package:influencer_app/features/task/domain/use_cases/get_task.dart';
import 'package:influencer_app/features/task/presentation/pages/detail/task_detail_store.dart';
import 'package:influencer_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:influencer_app/features/user/domain/repositories/user_repository.dart';
import 'package:influencer_app/features/user/domain/usecases/get_all_users.dart';

import '../user/data/data_sources/parse_user_datasource.dart';

import 'data/data_sources/parse_task_datasource.dart';
import 'data/repositories/task_repository_impl.dart';
import 'domain/repositories/task_repository.dart';
import 'domain/use_cases/update_task.dart';
import 'presentation/pages/detail/task_detail_page.dart';
import 'presentation/pages/list/task_list_page.dart';
import 'presentation/pages/list/task_list_store.dart';

class TaskModule extends Module {
  @override
  void binds(Injector i) {
    i.add(ParseTaskDatasource.new);
    i.add(ParseUserDatasource.new);
    i.add<TaskRepository>(TaskRepositoryImpl.new);
    i.add<UserRepository>(UserRepositoryImpl.new);

    i.add(CreateTask.new);
    i.add(DeleteTask.new);
    i.add(GetAllUsers.new);
    i.add(GetAllTasks.new);
    i.add(GetTask.new);
    i.add(UpdateTask.new);

    i.add(TaskListStore.new);
    i.add(TaskDetailStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => TaskListPage(),
      transition: TransitionType.noTransition,
    );
    r.child(
      '/:id',
      child: (context) => TaskDetailPage(taskId: r.args.params['id']),
    );
  }
}
