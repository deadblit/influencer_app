import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';

import 'presentation/pages/login/login_page.dart';
import 'presentation/pages/login/login_store.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void binds(Injector i) {
    i.add<LoginStore>(LoginStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/login', child: (context) => const LoginPage());
  }
}
