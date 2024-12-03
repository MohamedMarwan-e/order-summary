import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/orders_overview/presentation/view/orders_chart_view.dart';
import '../../features/orders_overview/presentation/view/orders_view.dart';
import 'route_observer.dart';


const String ordersChart = '/OrdersChart';
const String ordersOverview = '/OrdersOverview';

class AppRouter {
  GoRouter getRouter({String? initialLocation}) {
    return GoRouter(
      initialLocation: initialLocation ?? ordersOverview,
      debugLogDiagnostics: false,
      observers: [RouteLoggingObserver()],
      routes: [
        GoRoute(
          path: ordersOverview,
          name: ordersOverview,
          builder: (context, state) => const OrdersOverview(),
        ),
        GoRoute(
          path: ordersChart,
          name: ordersChart,
          builder: (context, state) => const OrdersChartView(),
        )
      ],

      errorPageBuilder: (context, state) {
        return MaterialPage(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('No Route Found'),
            ),
            body: const Center(child: Text('No Route Found')),
          ),
        );
      },
    );
  }
}