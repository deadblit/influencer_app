import 'package:parse_server_sdk/parse_server_sdk.dart';

extension GetException on ParseResponse {
  Exception getException() {
    final exception = error?.exception;
    final message = error?.message;

    if (exception == null) {
      final parseError = results?.firstWhere(
        (element) => element.runtimeType == ParseError,
        orElse: () => null,
      );

      if (parseError == null) {
        return Exception(message ?? 'Erro do Parse desconhecido');
      }

      return Exception(
          '${parseError.message} (type: ${parseError.type}, code: ${parseError.code})');
    }

    return exception;
  }
}
