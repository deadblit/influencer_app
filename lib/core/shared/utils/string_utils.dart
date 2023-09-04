bool isEmptyOrNull(String? value) {
  return value?.isEmpty ?? true;
}

bool isNotEmptyOrNull(String? value) {
  return value?.isNotEmpty ?? false;
}
