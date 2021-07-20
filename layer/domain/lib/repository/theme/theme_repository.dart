abstract class ThemeRepository {
  Future<int> getCurrentTheme();

  Future setCurrentTheme({
    required int themeId,
  });
}
