import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voltride/core/network/tesla_api_client.dart';
import 'package:voltride/core/services/firestore_telemetry_service.dart';
import 'package:voltride/features/auth/domain/auth_repository.dart';
import 'package:voltride/features/auth/data/auth_repository_impl.dart';
import 'package:voltride/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/charging/presentation/bloc/charging_bloc.dart';
import 'package:voltride/features/dashboard/domain/vehicle_repository.dart';
import 'package:voltride/features/dashboard/data/repositories/vehicle_repository_impl.dart';
import 'package:voltride/core/services/vehicle_data_service.dart';
import 'package:voltride/features/dashboard/data/services/intelligence_engine.dart';
import 'package:voltride/features/telemetry/data/services/trip_detection_service.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';
import 'package:voltride/features/charging/data/repositories/charging_repository_impl.dart';
import 'package:voltride/features/charging/data/repositories/charging_history_cache.dart';
import 'package:voltride/features/dashboard/data/services/telemetry_analytics_service.dart';
import 'package:voltride/features/telemetry/data/repositories/trip_repository.dart';
import 'package:voltride/features/telemetry/data/repositories/charge_session_repository.dart';
import 'package:voltride/features/telemetry/domain/repositories/telemetry_repository.dart';
import 'package:voltride/features/telemetry/data/repositories/telemetry_repository_impl.dart';
import 'package:voltride/features/auth/domain/security_repository.dart';
import 'package:voltride/features/auth/data/security_repository_impl.dart';
import 'package:voltride/features/telemetry/presentation/bloc/telemetry_bloc.dart';

final sl = GetIt.instance; // sl stands for Service Locator

Future<void> init() async {
  // BLoCs
  sl.registerLazySingleton(() => AuthBloc(sl(), sl()));
  sl.registerLazySingleton(() => VehicleBloc(sl(), sl(), sl(), sl(), sl()));
  sl.registerLazySingleton(() => ChargingBloc(sl(), sl<ChargeSessionRepository>()));
  sl.registerLazySingleton(() => TelemetryBloc(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<SecurityRepository>(() => SecurityRepositoryImpl(sl()));
  
  sl.registerLazySingleton<VehicleRepository>(() => VehicleRepositoryImpl(
    sl(), // apiClient
    sl<Box<BatterySnapshot>>(instanceName: 'battery_snapshots'), // batteryBox
    sl<Box<DriveSession>>(instanceName: 'trip_sessions'), // tripBox
    sl<Box<ChargeSession>>(instanceName: 'charge_sessions'), // chargeBox
    sl<Box<VehicleCache>>(instanceName: 'vehicle_cache'), // vehicleCacheBox
    sl(), // tripDetectionService
  ));
  sl.registerLazySingleton<ChargingRepository>(() => ChargingRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<TelemetryRepository>(() => TelemetryRepositoryImpl(
    sl(), 
    sl(),
    sl<Box<DriveSession>>(instanceName: 'trip_sessions'),
    sl<Box<ChargeSession>>(instanceName: 'charge_sessions'),
  ));
  sl.registerLazySingleton<TripRepository>(() => TripRepository(
    sl<Box<DriveSession>>(instanceName: 'trip_sessions'),
  ));
  sl.registerLazySingleton<ChargeSessionRepository>(() => ChargeSessionRepository(
    sl<Box<ChargeSession>>(instanceName: 'charge_sessions'),
  ));

  // API Client
  sl.registerLazySingleton(() => TeslaApiClient(sl(), sl(), sl()));

  // Services
  sl.registerLazySingleton(() => TelemetryAnalyticsService());
  sl.registerLazySingleton(() => VehicleDataService(sl()));
  sl.registerLazySingleton(() => TripDetectionService(sl()));
  sl.registerLazySingleton(() => IntelligenceEngine(sl()));
  sl.registerLazySingleton(() => FirestoreTelemetryService(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  
  // Hive Boxes
  sl.registerLazySingleton(() => Hive.box('telemetry_history'), instanceName: 'telemetry_history');
  sl.registerLazySingleton(() => Hive.box<BatterySnapshot>('battery_snapshots'), instanceName: 'battery_snapshots');
  sl.registerLazySingleton(() => Hive.box<DriveSession>('trip_sessions'), instanceName: 'trip_sessions');
  sl.registerLazySingleton(() => Hive.box<ChargeSession>('charge_sessions'), instanceName: 'charge_sessions');
  sl.registerLazySingleton(() => Hive.box<VehicleCache>('vehicle_cache'), instanceName: 'vehicle_cache');
  sl.registerLazySingleton(() => Hive.box('user_prefs'), instanceName: 'user_prefs');
  sl.registerLazySingleton(() => Hive.box('vehicle_settings'), instanceName: 'vehicle_settings');
  sl.registerLazySingleton(() => ChargingHistoryCache(Hive.box('charging_history_cache')));
}
