import 'package:flutter_modular/flutter_modular.dart';

import 'auth/auth_module.dart';
import 'auth/data/repositories/auth_repository_interface.dart';
import 'auth/data/repositories/parse_auth_repository.dart';
import 'auth/login_guard.dart';
import 'campaign/campaign_module.dart';
import 'task/task_module.dart';
import 'user/user_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<IAuthRepository>(ParseAuthRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.redirect('/', to: '/tasks');

    r.module('/auth', module: AuthModule());
    r.module('/tasks', module: TaskModule(), guards: [LoginGuard()]);
    r.module('/campaigns', module: CampaignModule(), guards: [LoginGuard()]);
    r.module('/users', module: UserModule(), guards: [LoginGuard()]);
  }
}
