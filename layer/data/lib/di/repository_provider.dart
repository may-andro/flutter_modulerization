import 'package:data/di/local_provider.dart';
import 'package:data/di/location_provider.dart';
import 'package:data/di/mapper_provider.dart';
import 'package:data/di/remote_provider.dart';
import 'package:data/local/shared_preference/shared_preference_manager.dart';
import 'package:data/location/location_client.dart';
import 'package:data/mapper/pollutant_response/pollutant_response_model_entity_mapper.dart';
import 'package:data/remote/data_source/remote_data_source.dart';
import 'package:data/repository/location/location_repository.dart';
import 'package:data/repository/theme/theme_repository.dart';
import 'package:domain/repository/location/location_repository.dart';
import 'package:domain/repository/theme/theme_repository.dart';
import 'package:data/repository/air_pollutant/air_pollutant_repository_impl.dart';
import 'package:domain/repository/air_pollutant/air_pollutant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final airPollutantRepositoryImplProvider = Provider<AirPollutantRepository>((ref) {
  final remoteDataSource = ref.read<RemoteDataSource>(remoteDataSourceProvider);
  final pollutantResponseModelEntityMapper =
      ref.read<PollutantResponseModelEntityMapper>(pollutantResponseModelEntityMapperProvider);
  return AirPollutantRepositoryImpl(
    remoteDataSource,
    pollutantResponseModelEntityMapper,
  );
});

final themeRepositoryImplProvider = Provider<ThemeRepository>((ref) {
  final sharedPreferenceManager = ref.watch<SharedPreferenceManager>(sharedPreferenceManagerProvider);
  return ThemeRepositoryImpl(sharedPreferenceManager);
});

final locationRepositoryImplProvider = Provider<LocationRepository>((ref) {
  final locationClient = ref.watch<LocationClient>(locationClientProvider);
  return LocationRepositoryImpl(locationClient);
});
