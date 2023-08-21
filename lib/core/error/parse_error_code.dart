enum ParseErrorCode {
  objectNotFound(code: 101, name: "ObjectNotFound");

  const ParseErrorCode({
    required this.code,
    required this.name,
  });

  final int code;
  final String name;
}
