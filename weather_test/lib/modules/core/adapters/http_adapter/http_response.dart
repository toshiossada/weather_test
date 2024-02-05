class HttpResponse {
  const HttpResponse({
    required this.statusCode,
    this.data,
  });
  final dynamic data;
  final int statusCode;
}
