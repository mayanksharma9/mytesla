import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'core/theme/volt_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/injection_container.dart' as di;
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'features/charging/presentation/bloc/charging_bloc.dart';
import 'features/dashboard/data/models/tesla_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register Adapters
  Hive.registerAdapter(VehicleStateAdapter());
  Hive.registerAdapter(BatterySnapshotAdapter());
  Hive.registerAdapter(ChargeSessionAdapter());
  Hive.registerAdapter(DriveSessionAdapter());
  Hive.registerAdapter(LocalVehicleInfoAdapter());
  Hive.registerAdapter(ChargingHistoryEntryAdapter());
  Hive.registerAdapter(VehicleCacheAdapter());

  // Open Boxes
  await Hive.openBox('telemetry_history');
  await Hive.openBox<BatterySnapshot>('battery_snapshots');
  await Hive.openBox<DriveSession>('trip_sessions');
  await Hive.openBox<ChargeSession>('charge_sessions');
  await Hive.openBox<VehicleCache>('vehicle_cache');
  await Hive.openBox('vehicle_settings');
  await Hive.openBox('user_prefs');

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Anonymous Sign-in for Firestore permissions
  try {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    debugPrint('Firebase: Anonymous sign-in successful: ${userCredential.user?.uid}');
  } catch (e) {
    debugPrint('Firebase: Anonymous sign-in failed: $e');
  }
  
  await dotenv.load(fileName: ".env");
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint('App State: Resumed from background, triggering vehicle wake...');
      // Use the global Navigator key or a context that has access to the BLoC
      // Since MyApp is the parent, we might need a way to reach the BLoCs.
      // Actually, since we're using MultiBlocProvider, we can use a key or just ensure we have access.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthBloc>()..add(AppStarted())),
        BlocProvider(create: (context) => di.sl<VehicleBloc>()),
        BlocProvider(create: (context) => di.sl<ChargingBloc>()..add(FetchNearbyStations())),
      ],
      child: Builder(
        builder: (context) {
          // Listen for lifecycle changes here if we want direct bloc access
          return _LifecycleWatcher(
            child: MaterialApp.router(
              title: 'VoltRide',
              debugShowCheckedModeBanner: false,
              theme: VoltTheme.light(),
              themeMode: ThemeMode.dark, // Default to dark as per spec
              darkTheme: VoltTheme.dark(),
              routerConfig: AppRouter.router,
            ),
          );
        }
      ),
    );
  }
}

class _LifecycleWatcher extends StatefulWidget {
  final Widget child;
  const _LifecycleWatcher({required this.child});

  @override
  State<_LifecycleWatcher> createState() => _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<_LifecycleWatcher> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint('LifecycleWatcher: App resumed, triggering WakeOnForeground');
      context.read<VehicleBloc>().add(WakeOnForeground());
      // Also refresh charging data
      context.read<ChargingBloc>().add(const FetchChargingHistory(refresh: true));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
