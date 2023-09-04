import 'failure.dart';

class NotFoundFailure extends Failure {
  final String? message;

  NotFoundFailure(this.message);

  NotFoundFailure.fromError(super.error) : message = null;

  @override
  String toString() {
    return message ?? super.toString();
  }
}
