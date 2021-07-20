import 'package:data/model/pollutant_response/pollutant_response_model.dart';

abstract class RemoteDataSource {
  Future<PollutantResponseModel> getCurrentAirPollutantList({
    required double latitude,
    required double longitude,
  });

  Future<PollutantResponseModel> getForecastAirPollutantList({
    required double latitude,
    required double longitude,
  });

  Future<PollutantResponseModel> getHistoryAirPollutantList({
    required double latitude,
    required double longitude,
    required int start,
    required int end,
  });
}
