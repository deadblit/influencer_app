import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/task_detail_page.dart';
import 'presentation/pages/task_list_page.dart';

class TaskModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const TaskListPage());
    r.child('/:id', child: (context) => const TaskDetailPage());
  }
}
