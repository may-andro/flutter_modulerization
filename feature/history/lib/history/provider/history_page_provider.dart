import 'package:air_quality/app/app_state/app_state.dart';
import 'package:common/common.dart';
import 'package:data/di/usecase_provider.dart';
import 'package:domain/entity/pollutant.dart';
import 'package:domain/usecase/air_pollutant/get_air_pollutant_history_usecase.dart';
import 'package:domain/utils/result_state/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:history/history/model/pollutant_list_item.dart';
import 'package:history/mapper/pollutant_list_ui_item_mapper.dart';
import 'package:air_quality/app/app_state/provider/app_state_provider.dart';

final provideAirPollutantHistory = FutureProvider<Result<List<Pollutant>>>((ref) async {
  final _appState = ref.read<AppGlobalState>(appStateProvider);

  final param = GetAirPollutantHistoryParam(
    latitude: _appState.getCurrentLocation()!.latitude,
    longitude: _appState.getCurrentLocation()!.longitude,
    start: DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch ~/ 1000,
    end: DateTime.now().millisecondsSinceEpoch ~/ 1000,
  );
  final getGetAirPollutantHistoryUseCase =
      ref.read<GetAirPollutantHistoryUseCase>(getAirPollutantHistoryUseCaseProvider);
  return getGetAirPollutantHistoryUseCase.call(param);
});

final pollutantListUiItemMapperProvider = Provider<PollutantListUiItemMapper>((ref) {
  final airIndexModelEntityMapper = ref.read<AirIndexModelEntityMapper>(airIndexModelEntityMapperProvider);
  final airIndexColorModelEntityMapper =
      ref.read<AirIndexColorModelEntityMapper>(airIndexColorModelEntityMapperProvider);

  return PollutantListUiItemMapper(
    airIndexModelEntityMapper,
    airIndexColorModelEntityMapper,
  );
});

final provideAirPollutantList = FutureProvider.family<List<PollutantListItem>, List<Pollutant>>((ref, param) async {
  final pollutantListUiItemMapper = ref.read<PollutantListUiItemMapper>(pollutantListUiItemMapperProvider);
  return await Future.value(pollutantListUiItemMapper.to(param));
});
