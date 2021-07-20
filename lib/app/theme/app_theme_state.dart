import 'package:common/common.dart';
import 'package:domain/usecase/theme/get_app_theme_usecase.dart';
import 'package:domain/usecase/theme/set_app_theme_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_theme.dart';
import 'mapper/app_theme_mapper.dart';

class AppThemeNotifier extends StateNotifier<ThemeData> {
  final logger = AppLogger.setLogTag('AppThemeNotifier');

  AppThemeNotifier(
    this._getAppThemeUseCase,
    this._setAppThemeUseCase,
    this._appThemeMapper,
  ) : super(AppTheme.lightThemeData);

  final GetAppThemeUseCase _getAppThemeUseCase;
  final SetAppThemeUseCase _setAppThemeUseCase;
  final AppThemeMapper _appThemeMapper;

  AppThemeType _currentAppThemeType = AppThemeType.light;

  AppThemeType getCurrentAppThemeType() {
    return _currentAppThemeType;
  }

  Future setAppTheme(AppThemeType appThemeType) async {
    AppLogger.logDebug('setAppTheme $appThemeType', logger: logger);

    await _setAppThemeUseCase.call(appThemeType.index);
    _currentAppThemeType = appThemeType;
    final appTheme = _appThemeMapper.to(_currentAppThemeType);
    state = appTheme;
    return appTheme;
  }

  Future<ThemeData> getAppTheme() async {
    AppLogger.logDebug('getAppTheme', logger: logger);

    final themeId = await _getAppThemeUseCase.call();
    _currentAppThemeType = AppThemeType.values[themeId];
    final appTheme = _appThemeMapper.to(_currentAppThemeType);
    state = appTheme;
    return appTheme;
  }
}
