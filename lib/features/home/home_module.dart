import 'package:flutter_modular/flutter_modular.dart';

import 'package:influencer_app/features/auth/auth_module.dart';

import '../auth/login_guard.dart';

import 'presentation/pages/home_page.dart';

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
    r.child('/', child: (context) => const HomePage(), guards: [LoginGuard()]);
  }
}
