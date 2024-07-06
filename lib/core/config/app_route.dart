import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/modules/home/view/home_view.dart';
import '../../app/modules/qr_screen/view/qr_view.dart';
import '../../app/modules/redeem_points_screen/view/redeem_points.dart';
import '../../app/modules/splash/views/splash_view.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
// final shellNavigatorStockScreenKey =
//     GlobalKey<NavigatorState>(debugLabel: 'BudgetScreen');
// final shellNavigatorMeetingsScreenKey =
//     GlobalKey<NavigatorState>(debugLabel: ' FinancesScreen');
// final shellNavigatorCommitteesScreenKey =
//     GlobalKey<NavigatorState>(debugLabel: ' DashboardScreen');
// final shellNavigatorMoreScreenKey =
//     GlobalKey<NavigatorState>(debugLabel: ' GoalsScreen');

class AppRouter {
  static final route = GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: HomeView.route,
          builder: (context, state) => const HomeView(),
        ),
        
        // GoRoute(
        //   path: HomeView.route,
        //   name: HomeView.route,
        //   builder: (context, state) => HomeView(
            
        //   ),
        // ),

        
        GoRoute(
          path: QrView.routePath,
          name: QrView.routeName,
          builder: (context, state) => QrView(
            encryptionQr: state.pathParameters["encryptionQr"],
          ),
        ),

        GoRoute(
          path: RedeemPointsView.route,
          name: RedeemPointsView.route,
          builder: (context, state) => const RedeemPointsView(),
        ),
        //
        // StatefulShellRoute.indexedStack(
        //   builder: (context, state, navigationShell) {
        //     return MainScreen(navigationShell);
        //   },
        //   branches: [
        //     // The route branch for the 1º Tab
        //     StatefulShellBranch(
        //       navigatorKey: shellNavigatorHomeKey,
        //       // Add this branch routes
        //       // each routes with its sub routes if available e.g feed/uuid/details
        //       routes: <RouteBase>[],
        //     ),
        //     // The route branch for 2º Tab
        //     StatefulShellBranch(
        //         navigatorKey: shellNavigatorStockScreenKey,
        //         routes: <RouteBase>[]),
        //     // The route branch for 3 Tab
        //     StatefulShellBranch(
        //         navigatorKey: shellNavigatorMeetingsScreenKey,
        //         routes: <RouteBase>[]),
        //     // The route branch for 4 Tab
        //     StatefulShellBranch(
        //         navigatorKey: shellNavigatorCommitteesScreenKey,
        //         routes: <RouteBase>[]),
        //   ],
        // ),
      ]);
}
