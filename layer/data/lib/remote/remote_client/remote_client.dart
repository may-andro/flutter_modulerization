import 'package:dio/dio.dart';

abstract class RemoteClient {
  Future<Response<dynamic>> getApiCall(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Response<dynamic>> postApiCall(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
