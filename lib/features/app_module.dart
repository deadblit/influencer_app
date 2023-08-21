import 'package:flutter_modular/flutter_modular.dart';

import 'auth/auth_module.dart';
import 'auth/data/repositories/auth_repository_interface.dart';
import 'auth/data/repositories/parse_auth_repository.dart';
import 'home/home_module.dart';
import 'task/task_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<IAuthRepository>(ParseAuthRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());
    r.module('/auth', module: AuthModule());
    r.module('/tasks', module: TaskModule());
  }
}
