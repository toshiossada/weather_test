abstract class Failure implements Exception {
  String? get message;
}

class MapperError extends Failure {

  MapperError({
    this.message,
  });
  @override
  final String? message;
}

class DesserializeError extends Failure {

  DesserializeError({
    this.message,
  });
  @override
  final String? message;
}
