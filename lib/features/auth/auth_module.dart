import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/login/login_page.dart';
import 'presentation/pages/login/login_store.dart';

class AuthModule extends Module {
  //final _
  @override
  void exportedBinds(i) {
    // i.addSingleton<IAuthRepository>(ParseAuthRepository.new);
    // i.addInstance(instance)
  }

  @override
  void binds(Injector i) {
    //i.addSingleton<IAuthRepository>(ParseAuthRepository.new);
    i.add<LoginStore>(LoginStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/login', child: (context) => const LoginPage());
  }
}
