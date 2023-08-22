import 'package:parse_server_sdk/parse_server_sdk.dart';

extension GetException on ParseResponse {
  Exception getException() {
    final exception = error?.exception;
    final message = error?.message;

    if (exception == null) {
      return Exception(message);
    }

    return exception;
  }
}
