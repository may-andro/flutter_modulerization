import 'package:data/mapper/pollutant_response/pollutant_response_model_entity_mapper.dart';
import 'package:data/remote/data_source/remote_data_source.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:domain/repository/air_pollutant/air_pollutant_repository.dart';
import 'package:domain/utils/result_state/result.dart';

class AirPollutantRepositoryImpl implements AirPollutantRepository {
  AirPollutantRepositoryImpl(this._remoteDataSource, this._pollutantResponseModelEntityMapper);

  final RemoteDataSource _remoteDataSource;
  final PollutantResponseModelEntityMapper _pollutantResponseModelEntityMapper;

  @override
  Future<Result<List<Pollutant>>> getCurrentAirPollutantList({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _remoteDataSource.getCurrentAirPollutantList(
        latitude: latitude,
        longitude: longitude,
      );
      return Success(data: _pollutantResponseModelEntityMapper.mapFromModelToEntity(response));
    } catch (e) {
      return Error(error: e);
    }
  }

  @override
  Future<Result<List<Pollutant>>> getForecastAirPollutantList({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final response = await _remoteDataSource.getForecastAirPollutantList(
        latitude: latitude,
        longitude: longitude,
      );
      return Success(data: _pollutantResponseModelEntityMapper.mapFromModelToEntity(response));
    } catch (e) {
      return Error(error: e as Exception);
    }
  }

  @override
  Future<Result<List<Pollutant>>> getHistoryAirPollutantList({
    required double latitude,
    required double longitude,
    required int start,
    required int end,
  }) async {
    try {
      final response = await _remoteDataSource.getHistoryAirPollutantList(
        latitude: latitude,
        longitude: longitude,
        start: start,
        end: end,
      );
      return Success(data: _pollutantResponseModelEntityMapper.mapFromModelToEntity(response));
    } catch (e) {
      return Error(error: e as Exception);
    }
  }
}
