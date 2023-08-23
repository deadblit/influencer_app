import 'dart:developer';

extension Log on Exception {
  void logMessage(String logMessage, {String name = ''}) {
    log('$logMessage: ${toString()}', name: name, error: this);
  }
}
