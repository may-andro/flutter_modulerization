import 'package:air_quality/presentation/feature/setting/widget/theme_setting_widget.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ThemeSettingModelMapper implements UnidirectionalObjectMapper<List<AppThemeType>, List<ThemeSettingModel>> {
  const ThemeSettingModelMapper({required this.currentAppThemeType});

  final AppThemeType currentAppThemeType;

  @override
  List<ThemeSettingModel> to(List<AppThemeType> list) {
    return [
      ThemeSettingModel(
        themeIcon: Icons.wb_sunny,
        themeName: "Light",
        themeType: AppThemeType.light,
        isSelected: currentAppThemeType == AppThemeType.light,
      ),
      ThemeSettingModel(
        themeIcon: Icons.nightlight_round,
        themeName: "Dark",
        themeType: AppThemeType.dark,
        isSelected: currentAppThemeType == AppThemeType.dark,
      )
    ];
  }
}
