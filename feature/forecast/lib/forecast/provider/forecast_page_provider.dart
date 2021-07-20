import 'package:air_quality/app/app_state/app_state.dart';
import 'package:common/common.dart';
import 'package:data/di/usecase_provider.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:domain/usecase/air_pollutant/get_air_pollutant_forecast_usecase.dart';
import 'package:domain/utils/result_state/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forecast/mapper/forecast_ui_mapper_mapper.dart';
import 'package:air_quality/app/app_state/provider/app_state_provider.dart';

import '../model/forecast_ui_model.dart';

final provideAirPollutantForecast = FutureProvider<Result<List<Pollutant>>>((ref) async {
  final _appState = ref.read<AppGlobalState>(appStateProvider);

  final param = GetAirPollutantForecastParam(
    latitude: _appState.getCurrentLocation()!.latitude,
    longitude: _appState.getCurrentLocation()!.longitude,
  );
  final getAirPollutantForecastUseCase =
      ref.read<GetAirPollutantForecastUseCase>(getAirPollutantForecastUseCaseProvider);
  return getAirPollutantForecastUseCase.call(param);
});

final forecastUiModelMapper = Provider<ForecastUiModelMapper>((ref) {
  final airIndexModelEntityMapper = ref.read<AirIndexModelEntityMapper>(airIndexModelEntityMapperProvider);
  final airIndexColorModelEntityMapper =
      ref.read<AirIndexColorModelEntityMapper>(airIndexColorModelEntityMapperProvider);

  return ForecastUiModelMapper(
    airIndexModelEntityMapper,
    airIndexColorModelEntityMapper,
  );
});

final provideAirPollutantMap =
    FutureProvider.family<Map<String, List<ForecastUiModel>>, List<Pollutant>>((ref, param) async {
  final pollutantListUiItemMapper = ref.read<ForecastUiModelMapper>(forecastUiModelMapper);
  return await Future.value(pollutantListUiItemMapper.to(param));
});
