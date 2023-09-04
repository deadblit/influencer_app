import 'package:flutter_modular/flutter_modular.dart';

import '../task/data/repositories/task_repository_impl.dart';
import '../task/domain/repositories/task_repository.dart';

import 'presentation/pages/user_detail_page.dart';
import 'presentation/pages/user_list_page.dart';

class UserModule extends Module {
  @override
  void binds(Injector i) {
    i.add<TaskRepository>(TaskRepositoryImpl.new);
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
