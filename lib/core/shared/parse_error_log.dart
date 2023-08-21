import 'dart:developer';

import 'package:parse_server_sdk/parse_server_sdk.dart';

extension Log on ParseError {
  void logMessage(String logMessage, {String name = ''}) {
    log('$logMessage: $message', name: name, error: exception);
  }
}
