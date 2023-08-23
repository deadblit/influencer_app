import 'package:flutter_modular/flutter_modular.dart';

import '../auth/auth_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    // r.child('/',
    //     child: (context) => const BaseHomePage(), guards: [LoginGuard()]);
  }
}
