import 'package:air_quality/app/app_state/app_state.dart';
import 'package:air_quality/app/app_state/provider/app_state_provider.dart';
import 'package:common/common.dart';
import 'package:data/di/usecase_provider.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:domain/usecase/air_pollutant/get_current_air_pollutant_usecase.dart';
import 'package:domain/utils/result_state/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard_view_model.dart';

final dashboardViewModelProvider = Provider<DashboardViewModel>((ref) {
  final airIndexModelEntityMapper = ref.read<AirIndexModelEntityMapper>(airIndexModelEntityMapperProvider);

  return DashboardViewModel(
    airIndexModelEntityMapper,
  );
});

final provideCurrentAirPollutant = FutureProvider<Result<List<Pollutant>>>((ref) async {
  final _appState = ref.read<AppGlobalState>(appStateProvider);

  final param = GetCurrentAirPollutantParam(
    latitude: _appState.getCurrentLocation()!.latitude,
    longitude: _appState.getCurrentLocation()!.longitude,
  );

  final getCurrentAirPollutantUseCase = ref.read<GetCurrentAirPollutantUseCase>(getCurrentAirPollutantUseCaseProvider);
  return getCurrentAirPollutantUseCase.call(param);
});
