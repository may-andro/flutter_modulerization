import 'package:air_quality/app/theme/provider/app_theme_provider.dart';
import 'package:air_quality/presentation/feature/setting/provider/setting_page_provider.dart';
import 'package:common/common.dart';
import 'package:component/loading/loading_widget.dart';
import 'package:component/text_widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSettingModel {
  ThemeSettingModel({
    required this.themeName,
    required this.themeIcon,
    required this.themeType,
    required this.isSelected,
  });

  final String themeName;
  final IconData themeIcon;
  final AppThemeType themeType;
  final bool isSelected;
}

final logger = AppLogger.setLogTag('ThemeSettingWidget');

class ThemeSettingWidget extends StatelessWidget {
  const ThemeSettingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
        child: Column(
          children: [
            TitleTextWidget(label: 'Theme'),
            SizedBox(height: 8),
            Divider(
              height: 1,
            ),
            SizedBox(height: 8),
            _buildThemeOptions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOptions(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final _appThemeStateNotifier = context.read(appThemeStateProvider.notifier);
      final _currentAppThemeType = _appThemeStateNotifier.getCurrentAppThemeType();
      final _themeSettingModelList = watch(themeSettingModelListProvider(_currentAppThemeType));
      AppLogger.logDebug('_themeSettingModelList ${_themeSettingModelList.toString()}', logger: logger);
      return _themeSettingModelList.when(
        data: (data) {
          return Row(
            children: data
                .map(
                  (item) => _buildThemeCardWidget(
                    context,
                    item,
                    (theme) => _appThemeStateNotifier.setAppTheme(theme.themeType),
                  ),
                )
                .toList(),
          );
        },
        loading: () => LoadingWidget(),
        error: (error, stack) => ErrorWidget(error as Exception),
      );
    });
  }

  Widget _buildThemeCardWidget(
    BuildContext context,
    ThemeSettingModel themeSettingModel,
    Function(ThemeSettingModel) onThemeSelection,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () => onThemeSelection(themeSettingModel),
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                themeSettingModel.themeIcon,
                size: themeSettingModel.isSelected ? 50.0 : 24.0,
              ),
              SizedBox(
                height: 4,
              ),
              Text(themeSettingModel.themeName),
            ],
          ),
        ),
      ),
    );
  }
}
