import 'package:common/common.dart';
import 'package:data/local/secure_storage/key_constant.dart';
import 'package:data/local/secure_storage/key_manager.dart';
import 'package:data/model/pollutant_response/pollutant_response_model.dart';
import 'package:data/remote/data_source/remote_data_source.dart';
import 'package:data/remote/remote_client/remote_client.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this._remoteClient, this._keyManager);

  final RemoteClient _remoteClient;
  final KeyManager _keyManager;

  Future<String?> _getApiIdKey() => Future.value("2dc6aa8559a87af058400abee0c46e54");
  //Future<String?> _getApiIdKey() => _keyManager.readValue(API_ID_KEY);

  @override
  Future<PollutantResponseModel> getCurrentAirPollutantList({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _remoteClient.getApiCall(
        'data/2.5/air_pollution',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': await _getApiIdKey(),
        },
      );
      return PollutantResponseModel.fromJson(response.data);
    } on TypeError catch (e) {
      throw ParsingException(e.stackTrace.toString());
    } catch (e) {
    	throw e;
    }
  }

  @override
  Future<PollutantResponseModel> getForecastAirPollutantList({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _remoteClient.getApiCall(
        'data/2.5/air_pollution/forecast',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': await _getApiIdKey(),
        },
      );
      return PollutantResponseModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<PollutantResponseModel> getHistoryAirPollutantList({
    required double latitude,
    required double longitude,
    required int start,
    required int end,
  }) async {
    try {
      final response = await _remoteClient.getApiCall(
        'data/2.5/air_pollution/history',
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'start': start,
          'end': end,
          'appid': await _getApiIdKey(),
        },
      );
      return PollutantResponseModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}
