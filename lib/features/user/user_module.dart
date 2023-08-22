import 'package:flutter_modular/flutter_modular.dart';

import 'package:influencer_app/features/task/data/repositories/parse_task_repository.dart';
import 'package:influencer_app/features/task/data/repositories/task_repository_interface.dart';
import 'package:influencer_app/features/task/presentation/pages/task_list_store.dart';
import 'package:influencer_app/features/user/presentation/pages/user_detail_page.dart';
import 'package:influencer_app/features/user/presentation/pages/user_list_page.dart';

class UserModule extends Module {
  @override
  void binds(Injector i) {
    i.add<ITaskRepository>(ParseTaskRepository.new);
    i.add(TaskListStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const UserListPage(),
      transition: TransitionType.noTransition,
    );
    r.child('/:id', child: (context) => const UserDetailPage());
  }
}
