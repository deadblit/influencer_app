import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
}
