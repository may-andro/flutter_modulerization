import 'package:data/local/shared_preference/shared_preference_manager.dart';
import 'package:domain/repository/theme/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  ThemeRepositoryImpl(this.sharedPreferenceManager);

  final SharedPreferenceManager sharedPreferenceManager;

  @override
  Future<int> getCurrentTheme() {
	  return Future.value(sharedPreferenceManager.getAppThemeId());
  }

  @override
  Future setCurrentTheme({required int themeId}) {
	  return sharedPreferenceManager.setAppThemeId(themeId);
  }
}
