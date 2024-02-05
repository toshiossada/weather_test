abstract class Failure implements Exception {
  String? get message;
}

class MapperError extends Failure {
  @override
  final String? message;

  MapperError({
    this.message,
  });
}

class DesserializeError extends Failure {
  @override
  final String? message;

  DesserializeError({
    this.message,
  });
}
