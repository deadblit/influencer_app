import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'features/app_module.dart';
import 'features/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
