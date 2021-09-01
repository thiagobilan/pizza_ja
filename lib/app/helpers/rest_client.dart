import 'package:get/get.dart';

class RestClient extends GetConnect {
  var baseUrl = 'http://10.0.0.10:8080';
  RestClient() {
    this.baseUrl = baseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;
  RestClientException({
    this.code,
    required this.message,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
