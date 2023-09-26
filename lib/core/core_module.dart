import 'package:flutter_modular/flutter_modular.dart';

import '../features/auth/data/repositories/auth_repository_interface.dart';
import '../features/auth/data/repositories/parse_auth_repository.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton<IAuthRepository>(ParseAuthRepository.new);
  }
}
