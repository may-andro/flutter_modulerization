import 'package:domain/repository/theme/theme_repository.dart';

class GetAppThemeUseCase {
  final ThemeRepository repository;

  GetAppThemeUseCase({required this.repository});

  Future<int> call() async {
    return await repository.getCurrentTheme();
  }
}
