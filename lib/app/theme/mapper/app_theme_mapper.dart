import 'package:common/common.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class AppThemeMapper implements UnidirectionalObjectMapper<AppThemeType, ThemeData> {
  @override
  ThemeData to(AppThemeType type) {
    late ThemeData themeData;
    switch (type) {
      case AppThemeType.light:
        themeData = AppTheme.lightThemeData;
        break;
      case AppThemeType.dark:
        themeData = AppTheme.darkThemeData;
        break;
      default:
        themeData = AppTheme.lightThemeData;
        break;
    }
    return themeData;
  }
}
