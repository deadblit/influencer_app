abstract class Failure {
  final Exception? error;

  Failure([this.error]);

  @override
  String toString() {
    return error?.toString() ?? runtimeType.toString();
  }
}
