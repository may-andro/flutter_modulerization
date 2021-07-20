import 'package:domain/entity/pollutant.dart';
import 'package:domain/repository/air_pollutant/air_pollutant_repository.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:domain/utils/result_state/result.dart';

class GetCurrentAirPollutantUseCase extends UseCase<GetCurrentAirPollutantParam, List<Pollutant>> {
  GetCurrentAirPollutantUseCase(this._repository);

  final AirPollutantRepository _repository;

  @override
  Future<Result<List<Pollutant>>> call(GetCurrentAirPollutantParam param) async {
    return await _repository.getCurrentAirPollutantList(
      latitude: param.latitude,
      longitude: param.longitude,
    );
  }
}

class GetCurrentAirPollutantParam {
  final double latitude;
  final double longitude;

  GetCurrentAirPollutantParam({
    required this.latitude,
    required this.longitude,
  });
}
