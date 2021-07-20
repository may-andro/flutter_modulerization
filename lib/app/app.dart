import 'package:air_quality/app/app_state/provider/app_state_provider.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../presentation/routes/app_route.gr.dart';
import 'theme/provider/app_theme_provider.dart';

class AirQualityApp extends StatelessWidget {
  final logger = AppLogger.setLogTag('AirQualityApp');
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    AppLogger.logDebug('build method', logger: logger);

    return Consumer(builder: (context, watch, child) {
      final _appTheme = watch(appThemeStateProvider);
      final _appState = context.read(appStateProvider.notifier);
      _appState.getCurrentLocation();

      return MaterialApp.router(
        title: 'Air Quality',
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        theme: _appTheme,
      );
    });
  }
}
