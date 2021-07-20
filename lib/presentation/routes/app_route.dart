import 'package:air_quality/presentation/feature/home/home_page.dart';
import 'package:air_quality/presentation/feature/splash/splash_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:forecast/route/module_route.dart';
import 'package:history/route/module_route.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/splash',
      page: SplashPage,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      initial: false,
      path: '/home',
      page: HomePage,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    ...historyRoutes,
    ...forecastRoutes,
  ],
)
class $AppRouter {}
