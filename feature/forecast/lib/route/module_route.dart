import 'package:auto_route/auto_route.dart';
import 'package:forecast/forecast/forecast_page.dart';

const forecastRoutes = [
  AutoRoute(
    path: 'forecast/*',
    page: ForecastPage,
    children: [
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
];
