import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/services/notification_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'core/theme/volt_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/injection_container.dart' as di;
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'features/charging/presentation/bloc/charging_bloc.dart';
import 'features/dashboard/data/models/tesla_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';

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
  // Vehicle data cache box for cold-start
  await Hive.openBox('vehicle_data_cache');
  // Maintenance tracker
  await Hive.openBox('maintenance');
  // Phantom drain sessions
  await Hive.openBox('phantom_drain');
  
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Sign in anonymously so Firestore security rules can validate writes.
  // Anonymous identity persists across app restarts on the same device.
  try {
    if (FirebaseAuth.instance.currentUser == null) {
      await FirebaseAuth.instance.signInAnonymously();
    }
  } catch (e) {
    debugPrint('main: Firebase anonymous sign-in failed: $e');
  }

  await di.init();
  await NotificationService().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthBloc>()..add(AppStarted())),
        BlocProvider(create: (context) => di.sl<VehicleBloc>()..add(WakeOnForeground())),
        BlocProvider(create: (context) => di.sl<ChargingBloc>()..add(FetchNearbyStations())),
      ],
      child: Builder(
        builder: (context) {
          return _LifecycleWatcher(
            child: MaterialApp.router(
              title: 'VoltRide',
              debugShowCheckedModeBanner: false,
              theme: VoltTheme.light(),
              themeMode: ThemeMode.dark,
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
      debugPrint('LifecycleWatcher: App resumed, triggering WakeAndFetch');
      context.read<VehicleBloc>().add(WakeOnForeground());
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
