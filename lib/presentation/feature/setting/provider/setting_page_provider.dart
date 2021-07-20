import 'package:air_quality/presentation/feature/setting/mapper/theme_setting_model_mapper.dart';
import 'package:air_quality/presentation/feature/setting/widget/theme_setting_widget.dart';
import 'package:common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeSettingModelMapperProvider = Provider.family<ThemeSettingModelMapper, AppThemeType>(
    (ref, appThemeType) => ThemeSettingModelMapper(currentAppThemeType: appThemeType));

final themeSettingModelListProvider =
    FutureProvider.family<List<ThemeSettingModel>, AppThemeType>((ref, appThemeType) async {
  final themeSettingModelMapper = ref.read<ThemeSettingModelMapper>(themeSettingModelMapperProvider(appThemeType));

  return Future.value(themeSettingModelMapper.to(AppThemeType.values));
});
