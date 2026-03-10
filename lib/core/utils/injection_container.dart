import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:voltride/core/network/tesla_api_client.dart';
import 'package:voltride/features/auth/domain/auth_repository.dart';
import 'package:voltride/features/auth/data/auth_repository_impl.dart';
import 'package:voltride/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:voltride/features/dashboard/presentation/bloc/vehicle_bloc.dart';
import 'package:voltride/features/charging/presentation/bloc/charging_bloc.dart';
import 'package:voltride/features/dashboard/domain/vehicle_repository.dart';
import 'package:voltride/features/dashboard/data/repositories/vehicle_repository_impl.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';
import 'package:voltride/features/charging/data/repositories/charging_repository_impl.dart';
import 'package:voltride/features/auth/domain/security_repository.dart';
import 'package:voltride/features/auth/data/security_repository_impl.dart';
import 'package:voltride/features/telemetry/domain/repositories/telemetry_repository.dart';
import 'package:voltride/features/telemetry/data/repositories/telemetry_repository_impl.dart';
import 'package:voltride/features/telemetry/presentation/bloc/telemetry_bloc.dart';

final sl = GetIt.instance; // sl stands for Service Locator

Future<void> init() async {
  // BLoCs
  sl.registerLazySingleton(() => AuthBloc(sl(), sl()));
  sl.registerLazySingleton(() => VehicleBloc(sl()));
  sl.registerLazySingleton(() => ChargingBloc(sl()));
  sl.registerLazySingleton(() => TelemetryBloc(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl(), sl()));
  sl.registerLazySingleton<SecurityRepository>(() => SecurityRepositoryImpl(sl()));
  
  // Choose between Production and Mock repository
  // For production builds, we use VehicleRepositoryImpl
  sl.registerLazySingleton<VehicleRepository>(() => VehicleRepositoryImpl(sl()));
  sl.registerLazySingleton<ChargingRepository>(() => ChargingRepositoryImpl(sl()));
  sl.registerLazySingleton<TelemetryRepository>(() => TelemetryRepositoryImpl(sl(), sl()));
  // sl.registerLazySingleton<VehicleRepository>(() => MockVehicleRepository());

  // API Client
  sl.registerLazySingleton(() => TeslaApiClient(sl(), sl(), sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
}
