import 'package:domain/entity/pollutant.dart';
import 'package:domain/repository/air_pollutant/air_pollutant_repository.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:domain/utils/result_state/result.dart';

class GetAirPollutantHistoryUseCase extends UseCase<GetAirPollutantHistoryParam, List<Pollutant>> {
  final AirPollutantRepository repository;

  GetAirPollutantHistoryUseCase({required this.repository});

  @override
  Future<Result<List<Pollutant>>> call(GetAirPollutantHistoryParam param) async {
    return await repository.getHistoryAirPollutantList(
      latitude: param.latitude,
      longitude: param.longitude,
      start: param.start,
      end: param.end,
    );
  }
}

class GetAirPollutantHistoryParam {
  final double latitude;
  final double longitude;
  final int start;
  final int end;

  GetAirPollutantHistoryParam({
    required this.latitude,
    required this.longitude,
    required this.start,
    required this.end,
  });
}
