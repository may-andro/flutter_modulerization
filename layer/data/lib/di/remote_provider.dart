import 'package:data/di/local_provider.dart';
import 'package:data/local/secure_storage/key_manager.dart';
import 'package:data/remote/data_source/remote_data_source.dart';
import 'package:data/remote/data_source/remote_data_source_impl.dart';
import 'package:data/remote/remote_client/dio_remote_client.dart';
import 'package:data/remote/remote_client/logging_interceptor.dart';
import 'package:data/remote/remote_client/remote_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  Dio _dio = new Dio();
  _dio.options.baseUrl = "https://api.openweathermap.org/";
  _dio.options.connectTimeout = 5000;
  _dio.options.connectTimeout = 3000;
  _dio.interceptors.add(LoggingInterceptor());
  return _dio;
});

final remoteClientProvider = Provider<RemoteClient>((ref) {
  final _dio = ref.read<Dio>(dioProvider);
  return DioRemoteClient(_dio);
});

final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  final _remoteClient = ref.read<RemoteClient>(remoteClientProvider);
  final _keyManager = ref.read<KeyManager>(keyManagerProvider);
  return RemoteDataSourceImpl(
    _remoteClient,
    _keyManager,
  );
});
