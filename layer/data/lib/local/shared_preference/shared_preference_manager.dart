import 'package:common/common.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shared_preference_keys.dart';

class SharedPreferenceManager {
  SharedPreferenceManager({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  int getAppThemeId() {
    return sharedPreferences.getInt(SharedPreferenceKey.appTheme) ?? AppThemeType.light.index;
  }

  Future<bool> setAppThemeId(int themeId) async {
    return await sharedPreferences.setInt(
      SharedPreferenceKey.appTheme,
      themeId,
    );
  }
}
