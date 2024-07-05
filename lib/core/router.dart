import 'package:andregarcia_kalshi/core/sizer.dart';
import 'package:andregarcia_kalshi/services/wellness_calculator/domain/entity/financial_health.dart';
import 'package:andregarcia_kalshi/ui/features/financial_health_calculator/pages/home_page.dart';
import 'package:andregarcia_kalshi/ui/features/financial_health_calculator/pages/result_page.dart';
import 'package:andregarcia_kalshi/ui/features/financial_health_calculator/pages/splash.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      Sizer.currentWidth = MediaQuery.of(context).size.width;
      Sizer.currentHeight = MediaQuery.of(context).size.height;
      return Splash();
    },
  ),
  GoRoute(
    path: '/home',
    builder: (BuildContext context, GoRouterState state) {
      return HomePage();
    },
  ),
  GoRoute(
    path: '/result',
    builder: (BuildContext context, GoRouterState state) {
      return ResultPage(state.extra as FinancialHealth);
    },
  )
]);
