import 'package:domain/entity/pollutant.dart';
import 'package:domain/repository/air_pollutant/air_pollutant_repository.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:domain/utils/result_state/result.dart';

class GetAirPollutantForecastUseCase extends UseCase<GetAirPollutantForecastParam, List<Pollutant>> {
  final AirPollutantRepository repository;

  GetAirPollutantForecastUseCase({required this.repository});

  @override
  Future<Result<List<Pollutant>>> call(GetAirPollutantForecastParam param) async {
    return await repository.getForecastAirPollutantList(
      latitude: param.latitude,
      longitude: param.longitude,
    );
  }
}

class GetAirPollutantForecastParam {
  final double latitude;
  final double longitude;

  GetAirPollutantForecastParam({
    required this.latitude,
    required this.longitude,
  });
}
