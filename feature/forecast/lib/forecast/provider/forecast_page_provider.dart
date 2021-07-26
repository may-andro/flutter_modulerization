import 'package:air_quality/app/app_state/app_state.dart';
import 'package:common/common.dart';
import 'package:data/di/usecase_provider.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:domain/usecase/air_pollutant/get_air_pollutant_forecast_usecase.dart';
import 'package:domain/utils/result_state/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:air_quality/app/app_state/provider/app_state_provider.dart';
import 'package:forecast/forecast/forecast_page_state.dart';
import 'package:forecast/forecast/mapper/forecast_item_list_mapper.dart';
import 'package:forecast/forecast/mapper/forecast_item_map_mapper.dart';
import 'package:forecast/forecast/model/forecast_list_item.dart';

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

final forecastListItemMapperProvider = Provider<ForecastItemMapMapper>((ref) {
  final airIndexModelEntityMapper = ref.read<AirIndexModelEntityMapper>(airIndexModelEntityMapperProvider);
  final airIndexColorModelEntityMapper =
      ref.read<AirIndexColorModelEntityMapper>(airIndexColorModelEntityMapperProvider);

  return ForecastItemMapMapper(
    airIndexModelEntityMapper,
    airIndexColorModelEntityMapper,
  );
});

final provideForecastListItemMapper = Provider<ForecastItemListMapper>((ref) {
  return ForecastItemListMapper();
});

final provideForecastItemMap =
    FutureProvider.family<Map<DateTime, List<ForecastItem>>, List<Pollutant>>((ref, param) async {
  final forecastItemMapMapper = ref.read<ForecastItemMapMapper>(forecastListItemMapperProvider);
  return await Future.value(forecastItemMapMapper.to(param));
});

final provideForecastItemList =
    FutureProvider.family<List<ForecastItem>, Map<ForecastItem, List<ForecastItem>>>((ref, param) async {
  final forecastListItemMapper = ref.read<ForecastItemListMapper>(provideForecastListItemMapper);
  return await Future.value(forecastListItemMapper.to(param));
});

final calenderListSelectionStateNotifierProvider =
    StateNotifierProvider<CalenderListSelectionStateNotifier, CalenderListSelectionState>(
        (ref) => CalenderListSelectionStateNotifier());
