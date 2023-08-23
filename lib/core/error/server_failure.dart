import 'failure.dart';

class ServerFailure extends Failure {
  final String? message;

  ServerFailure(this.message);

  ServerFailure.fromError(super.error) : message = null;

  @override
  String toString() {
    return message ?? super.toString();
  }
}
