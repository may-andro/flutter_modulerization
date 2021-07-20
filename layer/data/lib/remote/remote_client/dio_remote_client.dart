import 'package:common/common.dart';
import 'package:data/remote/remote_client/remote_client.dart';
import 'package:dio/dio.dart';

class DioRemoteClient implements RemoteClient {
  DioRemoteClient(this._dio);

  final Dio _dio;

  @override
  Future<Response> getApiCall(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (e) {
      throw ServerFailureException(e.message, code: e.response?.statusCode);
    } catch (e) {
      throw UnknownServerFailureException();
    }
  }

  @override
  Future<Response> postApiCall(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (e) {
      throw ServerFailureException(e.message, code: e.response?.statusCode);
    } catch (e) {
      throw UnknownServerFailureException();
    }
  }
}
