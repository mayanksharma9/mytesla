import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voltride/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:voltride/features/auth/presentation/pages/splash_page.dart';
import 'package:voltride/features/auth/presentation/pages/welcome_page.dart';
import 'package:voltride/features/dashboard/presentation/pages/home_page.dart';
import 'package:voltride/features/dashboard/presentation/pages/vehicle_selector_page.dart';
import 'package:voltride/features/dashboard/presentation/pages/main_scaffold.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/charging/presentation/pages/charging_page.dart';
import 'package:voltride/features/charging/presentation/pages/charging_history_page.dart';
import 'package:voltride/features/charging/presentation/pages/nearby_superchargers_page.dart';
import 'package:voltride/features/battery/presentation/pages/battery_page.dart';
import 'package:voltride/features/efficiency/presentation/pages/efficiency_page.dart';
import 'package:voltride/features/auth/presentation/pages/security_setup_page.dart';
import 'package:voltride/features/settings/presentation/pages/more_page.dart';
import 'package:voltride/features/settings/presentation/pages/notifications_settings_page.dart';
import 'package:voltride/features/settings/presentation/pages/maintenance_page.dart';
import 'package:voltride/features/settings/presentation/pages/automations_page.dart';
import 'package:voltride/features/settings/presentation/pages/cost_analytics_page.dart';
import 'package:voltride/features/settings/presentation/pages/drain_analytics_page.dart';
import 'package:voltride/features/telemetry/presentation/pages/energy_analytics_page.dart';
import 'package:voltride/features/telemetry/presentation/pages/trips_page.dart';
import 'package:voltride/core/utils/injection_container.dart';
import 'dart:async';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              Text(
                'Routing Error',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                state.error?.toString() ?? 'Unknown routing error',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.redAccent),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => context.go('/splash'),
                child: const Text('Go to Splash'),
              ),
            ],
          ),
        ),
      ),
    ),
    routes: [
      GoRoute(
        path: '/splash',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/welcome',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const WelcomePage(),
      ),

      GoRoute(
        path: '/security',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SecuritySetupPage(),
      ),
      GoRoute(
        path: '/vehicle-selector',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const VehicleSelectorPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          // HOME TAB
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          // BATTERY TAB
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/battery',
                builder: (context, state) => const BatteryPage(),
              ),
            ],
          ),
          // CHARGING TAB
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/charging',
                builder: (context, state) => const ChargingPage(),
              ),
            ],
          ),
          // EFFICIENCY TAB
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/efficiency',
                builder: (context, state) => const EfficiencyPage(),
              ),
            ],
          ),
          // MORE TAB
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/more',
                builder: (context, state) => const MorePage(),
                routes: [
                  GoRoute(
                    path: 'analytics',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const EnergyAnalyticsPage(),
                  ),
                  GoRoute(
                    path: 'cost-analytics',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const CostAnalyticsPage(),
                  ),
                  GoRoute(
                    path: 'drain',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const DrainAnalyticsPage(),
                  ),
                  GoRoute(
                    path: 'charging-history',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const ChargingHistoryPage(),
                  ),
                  GoRoute(
                    path: 'trips',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const TripsPage(),
                  ),
                  GoRoute(
                    path: 'automations',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const AutomationsPage(),
                  ),
                  GoRoute(
                    path: 'maintenance',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const MaintenancePage(),
                  ),
                  GoRoute(
                    path: 'notifications',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const NotificationsSettingsPage(),
                  ),
                  GoRoute(
                    path: 'security',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const SecuritySetupPage(),
                  ),
                  GoRoute(
                    path: 'nearby-superchargers',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const NearbySuperchargersPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final authState = sl<AuthBloc>().state;
      final vehicleState = sl<VehicleBloc>().state;
      
      final bool isAuthRoute = state.matchedLocation == '/welcome' || 
                              state.matchedLocation == '/splash';

      // 1. Unauthenticated state
      if (authState.status == AuthStatus.unauthenticated) {
        return isAuthRoute ? null : '/welcome';
      }

      // 2. Authenticated state
      if (authState.status == AuthStatus.authenticated) {
        if (!authState.isVirtualKeyRegistered && state.matchedLocation != '/security') {
          return '/security';
        }

        if (isAuthRoute || (authState.isVirtualKeyRegistered && state.matchedLocation == '/security' && state.uri.queryParameters['onboarding'] == 'true')) {
          return '/home';
        }
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(
      sl<AuthBloc>().stream,
    ),
  );
}
