import 'package:air_quality/app/theme/mapper/app_theme_mapper.dart';
import 'package:data/di/usecase_provider.dart';
import 'package:domain/usecase/theme/set_app_theme_usecase.dart';
import 'package:domain/usecase/theme/get_app_theme_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_theme_state.dart';

final appThemeMapperProvider = Provider<AppThemeMapper>((ref) => AppThemeMapper());

final appThemeStateProvider = StateNotifierProvider<AppThemeNotifier, ThemeData>((ref) {
  final getAppThemeUseCase = ref.read<GetAppThemeUseCase>(getAppThemeUseCaseProvider);
  final setAppThemeUseCase = ref.read<SetAppThemeUseCase>(setAppThemeUseCaseProvider);
  final appThemeMapper = ref.read<AppThemeMapper>(appThemeMapperProvider);

  return AppThemeNotifier(
    getAppThemeUseCase,
    setAppThemeUseCase,
    appThemeMapper,
  );
});
