// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:air_quality/presentation/feature/home/home_page.dart' as _i4;
import 'package:air_quality/presentation/feature/splash/splash_page.dart'
    as _i3;
import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;
import 'package:forecast/forecast/forecast_page.dart' as _i7;
import 'package:history/detail/history_detail_page.dart' as _i6;
import 'package:history/history/history_page.dart' as _i5;
import 'package:history/history/model/pollutant_list_item.dart' as _i8;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashPage();
        }),
    HomeRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.HomePage();
        }),
    HistoryRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<HistoryRouteArgs>(
              orElse: () => const HistoryRouteArgs());
          return _i5.HistoryPage(key: args.key);
        }),
    HistoryDetailRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<HistoryDetailRouteArgs>();
          return _i6.HistoryDetailPage(
              key: args.key, pollutantItem: args.pollutantItem);
        }),
    ForecastRoute.name: (routeData) => _i1.AdaptivePage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.ForecastPage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig('/#redirect',
            path: '/', redirectTo: '/splash', fullMatch: true),
        _i1.RouteConfig(SplashRoute.name, path: '/splash', children: [
          _i1.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i1.RouteConfig(HomeRoute.name, path: '/home', children: [
          _i1.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i1.RouteConfig(HistoryRoute.name, path: 'history/*', children: [
          _i1.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i1.RouteConfig(HistoryDetailRoute.name,
            path: 'history_detail/*',
            children: [
              _i1.RouteConfig('*#redirect',
                  path: '*', redirectTo: '', fullMatch: true)
            ]),
        _i1.RouteConfig(ForecastRoute.name, path: 'forecast/*', children: [
          _i1.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ])
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/splash', initialChildren: children);

  static const String name = 'SplashRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomeRoute';
}

class HistoryRoute extends _i1.PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({_i2.Key? key, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: 'history/*',
            args: HistoryRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HistoryRoute';
}

class HistoryRouteArgs {
  const HistoryRouteArgs({this.key});

  final _i2.Key? key;
}

class HistoryDetailRoute extends _i1.PageRouteInfo<HistoryDetailRouteArgs> {
  HistoryDetailRoute(
      {_i2.Key? key,
      required _i8.PollutantItem pollutantItem,
      List<_i1.PageRouteInfo>? children})
      : super(name,
            path: 'history_detail/*',
            args:
                HistoryDetailRouteArgs(key: key, pollutantItem: pollutantItem),
            initialChildren: children);

  static const String name = 'HistoryDetailRoute';
}

class HistoryDetailRouteArgs {
  const HistoryDetailRouteArgs({this.key, required this.pollutantItem});

  final _i2.Key? key;

  final _i8.PollutantItem pollutantItem;
}

class ForecastRoute extends _i1.PageRouteInfo {
  const ForecastRoute({List<_i1.PageRouteInfo>? children})
      : super(name, path: 'forecast/*', initialChildren: children);

  static const String name = 'ForecastRoute';
}
