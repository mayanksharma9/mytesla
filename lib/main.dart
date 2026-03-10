import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/theme/volt_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/injection_container.dart' as di;
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'features/charging/presentation/bloc/charging_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await dotenv.load(fileName: ".env");
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<AuthBloc>()..add(AppStarted())),
        BlocProvider(create: (context) => di.sl<VehicleBloc>()),
        BlocProvider(create: (context) => di.sl<ChargingBloc>()..add(FetchNearbyStations())),
      ],
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
}
