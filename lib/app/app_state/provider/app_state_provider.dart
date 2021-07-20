import 'package:data/di/usecase_provider.dart';
import 'package:domain/usecase/location/get_location_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_state.dart';

final appStateProvider = StateNotifierProvider<AppGlobalStateNotifier, AppGlobalState>((ref) {
  final getLocationUseCase = ref.read<GetLocationUseCase>(getLocationUseCaseProvider);

  return AppGlobalStateNotifier(getLocationUseCase);
});
