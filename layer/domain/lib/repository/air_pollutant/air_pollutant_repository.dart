import 'package:domain/entity/pollutant.dart';
import 'package:domain/utils/result_state/result.dart';

abstract class AirPollutantRepository {
  Future<Result<List<Pollutant>>> getCurrentAirPollutantList({
    required double latitude,
    required double longitude,
  });

  Future<Result<List<Pollutant>>> getForecastAirPollutantList({
    required double latitude,
    required double longitude,
  });

  Future<Result<List<Pollutant>>> getHistoryAirPollutantList({
    required double latitude,
    required double longitude,
    required int start,
    required int end,
  });
}
