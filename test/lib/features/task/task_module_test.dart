import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:influencer_app/features/task/task_module.dart';

void main() {
  setUpAll(() {
    initModule(TaskModule());
  });
}
