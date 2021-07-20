import 'package:auto_route/auto_route.dart';
import 'package:history/detail/history_detail_page.dart';

import '../history/history_page.dart';

const historyRoutes = [
  AutoRoute(
    path: 'history/*',
    page: HistoryPage,
    children: [
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
  AutoRoute(
    path: 'history_detail/*',
    page: HistoryDetailPage,
    children: [
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  ),
];
