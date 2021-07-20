import 'package:common/common.dart';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor();

  final logger = AppLogger.setLogTag('HistoryPage');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logPrint('*** API Request - Start ***');

    printKV('URI', options.uri);
    printKV('METHOD', options.method);
    logPrint('HEADERS:');
    options.headers.forEach((key, v) => printKV(' - $key', v));
    logPrint('BODY:');
    printAll(options.data ?? "");

    logPrint('*** API Request - End ***');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logPrint('*** Api Response - Start ***');

    printKV('URI', response.requestOptions.uri);
    printKV('STATUS CODE', response.statusCode ?? '');
    printKV('REDIRECT', response.isRedirect ?? '');
    logPrint('BODY:');
    printAll(response.data ?? "");

    logPrint('*** Api Response - End ***');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    logPrint('*** Api Error - Start ***:');

    logPrint('URI: ${err.requestOptions.uri}');
    if (err.response != null) {
      logPrint('STATUS CODE: ${err.response?.statusCode?.toString()}');
    }
    logPrint('$err');
    if (err.response != null) {
      printKV('REDIRECT', err.response?.realUri ?? '');
      logPrint('BODY:');
      printAll(err.response?.toString());
    }

    logPrint('*** Api Error - End ***:');
    super.onError(err, handler);
  }

  void printKV(String key, Object v) {
    AppLogger.logInfo('$key: $v', logger: logger);
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
    AppLogger.logDebug(s, logger: logger);
  }
}
