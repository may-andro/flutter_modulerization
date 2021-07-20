import 'package:domain/repository/theme/theme_repository.dart';

class SetAppThemeUseCase {
  final ThemeRepository repository;

  SetAppThemeUseCase({required this.repository});

  Future call(int themeId) async {
    return await repository.setCurrentTheme(themeId: themeId);
  }
}
