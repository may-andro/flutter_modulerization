import 'package:data/di/repository_provider.dart';
import 'package:domain/repository/air_pollutant/air_pollutant_repository.dart';
import 'package:domain/repository/location/location_repository.dart';
import 'package:domain/repository/theme/theme_repository.dart';
import 'package:domain/usecase/air_pollutant/get_air_pollutant_forecast_usecase.dart';
import 'package:domain/usecase/air_pollutant/get_air_pollutant_history_usecase.dart';
import 'package:domain/usecase/air_pollutant/get_current_air_pollutant_usecase.dart';
import 'package:domain/usecase/location/get_location_usecase.dart';
import 'package:domain/usecase/theme/get_app_theme_usecase.dart';
import 'package:domain/usecase/theme/set_app_theme_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAirPollutantForecastUseCaseProvider = Provider<GetAirPollutantForecastUseCase>((ref) {
  final repository = ref.read<AirPollutantRepository>(airPollutantRepositoryImplProvider);
  return GetAirPollutantForecastUseCase(repository: repository);
});

final getAirPollutantHistoryUseCaseProvider = Provider<GetAirPollutantHistoryUseCase>((ref) {
  final repository = ref.read<AirPollutantRepository>(airPollutantRepositoryImplProvider);
  return GetAirPollutantHistoryUseCase(repository: repository);
});

final getCurrentAirPollutantUseCaseProvider = Provider<GetCurrentAirPollutantUseCase>((ref) {
  final repository = ref.read<AirPollutantRepository>(airPollutantRepositoryImplProvider);
  return GetCurrentAirPollutantUseCase(repository);
});

final setAppThemeUseCaseProvider = Provider<SetAppThemeUseCase>((ref) {
  final repository = ref.watch<ThemeRepository>(themeRepositoryImplProvider);
  return SetAppThemeUseCase(repository: repository);
});

final getAppThemeUseCaseProvider = Provider<GetAppThemeUseCase>((ref) {
  final repository = ref.watch<ThemeRepository>(themeRepositoryImplProvider);
  return GetAppThemeUseCase(repository: repository);
});

final getLocationUseCaseProvider = Provider<GetLocationUseCase>((ref) {
  final repository = ref.watch<LocationRepository>(locationRepositoryImplProvider);
  return GetLocationUseCase(repository);
});
