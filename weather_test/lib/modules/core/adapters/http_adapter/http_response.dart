class HttpResponse {
  final dynamic data;
  final int statusCode;

  const HttpResponse({
    this.data,
    required this.statusCode,
  });
}
