import 'package:multiple_result/multiple_result.dart';

import '../error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Result<Type, Failure>> call(Params params);
}

class NoParams {}
