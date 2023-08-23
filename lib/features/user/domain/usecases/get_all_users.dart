import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetAllUsers extends Usecase<List<User>, NoParams> {
  final UserRepository userRepository;

  GetAllUsers(this.userRepository);

  @override
  Future<Result<List<User>, Failure>> call(NoParams params) async {
    return await userRepository.getAll();
  }
}
