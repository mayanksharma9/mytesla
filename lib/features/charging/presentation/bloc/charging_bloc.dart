import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';
import 'package:voltride/features/charging/domain/charging_analytics.dart';
import 'package:voltride/features/charging/data/repositories/charging_repository_impl.dart';
import 'package:voltride/features/telemetry/data/repositories/charge_session_repository.dart';

// ============================================================================
// Events
// ============================================================================

abstract class ChargingEvent extends Equatable {
  const ChargingEvent();
  @override
  List<Object?> get props => [];
}

class FetchNearbyStations extends ChargingEvent {}

/// Load first page of charging history + compute analytics.
class FetchChargingHistory extends ChargingEvent {
  final String? vin;
  final bool refresh;
  const FetchChargingHistory({this.vin, this.refresh = false});
  @override
  List<Object?> get props => [vin, refresh];
}

/// Load next page (append to existing list).
class LoadMoreChargingHistory extends ChargingEvent {
  final String? vin;
  const LoadMoreChargingHistory({this.vin});
  @override
  List<Object?> get props => [vin];
}

class FetchBusinessSessions extends ChargingEvent {
  final String? vin;
  final String? dateFrom;
  final String? dateTo;
  final int? limit;
  final int? offset;
  const FetchBusinessSessions(
      {this.vin, this.dateFrom, this.dateTo, this.limit, this.offset});
  @override
  List<Object?> get props => [vin, dateFrom, dateTo, limit, offset];
}

class DownloadInvoice extends ChargingEvent {
  final String contentId;
  const DownloadInvoice(this.contentId);
  @override
  List<Object?> get props => [contentId];
}

class SelectStation extends ChargingEvent {
  final ChargingLocation station;
  const SelectStation(this.station);
  @override
  List<Object?> get props => [station];
}

class LoadLocalSessions extends ChargingEvent {
  final String vin;
  const LoadLocalSessions(this.vin);
  @override
  List<Object?> get props => [vin];
}

// ============================================================================
// State
// ============================================================================

class ChargingState extends Equatable {
  final List<ChargingLocation> stations;

  // History – paginated
  final List<ChargingHistoryEntry> history;
  final bool isHistoryLoading;
  final bool isLoadingMore;
  final bool hasMoreHistory;
  final int currentPage;

  // Analytics
  final ChargingAnalytics analytics;
  final bool isAnalyticsLoading;

  // Local sessions (Hive)
  final List<ChargeSession> localSessions;

  // Fleet
  final List<ChargingSessionInfo> businessSessions;

  // UI helpers
  final ChargingLocation? selectedStation;
  final ChargingTariff? currentTariff;
  final bool isLoading;
  final String? error;
  final String? successMessage;

  const ChargingState({
    this.stations = const [],
    this.history = const [],
    this.isHistoryLoading = false,
    this.isLoadingMore = false,
    this.hasMoreHistory = true,
    this.currentPage = 1,
    ChargingAnalytics? analytics,
    this.isAnalyticsLoading = false,
    this.localSessions = const [],
    this.businessSessions = const [],
    this.selectedStation,
    this.currentTariff,
    this.isLoading = false,
    this.error,
    this.successMessage,
  }) : analytics = analytics ?? const _EmptyAnalytics();

  ChargingState copyWith({
    List<ChargingLocation>? stations,
    List<ChargingHistoryEntry>? history,
    bool? isHistoryLoading,
    bool? isLoadingMore,
    bool? hasMoreHistory,
    int? currentPage,
    ChargingAnalytics? analytics,
    bool? isAnalyticsLoading,
    List<ChargeSession>? localSessions,
    List<ChargingSessionInfo>? businessSessions,
    ChargingLocation? selectedStation,
    ChargingTariff? currentTariff,
    bool? isLoading,
    String? error,
    String? successMessage,
  }) =>
      ChargingState(
        stations: stations ?? this.stations,
        history: history ?? this.history,
        isHistoryLoading: isHistoryLoading ?? this.isHistoryLoading,
        isLoadingMore: isLoadingMore ?? this.isLoadingMore,
        hasMoreHistory: hasMoreHistory ?? this.hasMoreHistory,
        currentPage: currentPage ?? this.currentPage,
        analytics: analytics ?? this.analytics,
        isAnalyticsLoading: isAnalyticsLoading ?? this.isAnalyticsLoading,
        localSessions: localSessions ?? this.localSessions,
        businessSessions: businessSessions ?? this.businessSessions,
        selectedStation: selectedStation ?? this.selectedStation,
        currentTariff: currentTariff ?? this.currentTariff,
        isLoading: isLoading ?? this.isLoading,
        error: error,
        successMessage: successMessage,
      );

  @override
  List<Object?> get props => [
        stations, history, isHistoryLoading, isLoadingMore, hasMoreHistory,
        currentPage, analytics, isAnalyticsLoading, localSessions,
        businessSessions, selectedStation, currentTariff, isLoading,
        error, successMessage,
      ];
}

// Placeholder so the const constructor works before analytics are loaded.
class _EmptyAnalytics extends ChargingAnalytics {
  const _EmptyAnalytics()
      : super(
          lifetimeKwh: 0,
          lifetimeCost: 0,
          lifetimeSessions: 0,
          monthlyStats: const [],
          heatmap: const [
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
          ],
          topStations: const [],
          avgCostPerKwh: 0,
          avgKwhPerSession: 0,
          avgDurationMinutes: 0,
        );
}

// ============================================================================
// Bloc
// ============================================================================

const int _pageSize = 10;

class ChargingBloc extends Bloc<ChargingEvent, ChargingState> {
  final ChargingRepository _repository;
  final ChargeSessionRepository _localRepo;

  ChargingBloc(this._repository, this._localRepo) : super(const ChargingState()) {
    on<FetchNearbyStations>(_onFetchNearbyStations);
    on<FetchChargingHistory>(_onFetchChargingHistory);
    on<LoadMoreChargingHistory>(_onLoadMoreChargingHistory);
    on<FetchBusinessSessions>(_onFetchBusinessSessions);
    on<DownloadInvoice>(_onDownloadInvoice);
    on<SelectStation>(_onSelectStation);
    on<LoadLocalSessions>(_onLoadLocalSessions);
  }

  // ---------- Nearby stations ----------

  Future<void> _onFetchNearbyStations(
      FetchNearbyStations event, Emitter<ChargingState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final stations = await _repository.getChargingLocations();
      emit(state.copyWith(stations: stations, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // ---------- Charging history (page 1 + analytics) ----------

  Future<void> _onFetchChargingHistory(
      FetchChargingHistory event, Emitter<ChargingState> emit) async {
    emit(state.copyWith(
      isHistoryLoading: true,
      isAnalyticsLoading: true,
      error: null,
      currentPage: 1,
      hasMoreHistory: true,
    ));
    try {
      // Page 1 — show quickly
      final page1 = await _repository.getChargingHistory(
        vin: event.vin,
        pageNo: 1,
        pageSize: _pageSize,
      );
      emit(state.copyWith(
        history: page1,
        isHistoryLoading: false,
        hasMoreHistory: page1.length >= _pageSize,
      ));

      // Analytics — uses getAllCachedHistory which seeds from API if needed
      if (event.vin != null && _repository is ChargingRepositoryImpl) {
        // ignore: unnecessary_cast
        final impl = _repository as ChargingRepositoryImpl;
        final all = await impl.getAllCachedHistory(event.vin!);
        final analytics = ChargingAnalytics.compute(all);
        emit(state.copyWith(analytics: analytics, isAnalyticsLoading: false));
      } else {
        final analytics = ChargingAnalytics.compute(page1);
        emit(state.copyWith(analytics: analytics, isAnalyticsLoading: false));
      }
    } catch (e) {
      emit(state.copyWith(
        isHistoryLoading: false,
        isAnalyticsLoading: false,
        error: e.toString(),
      ));
    }
  }

  // ---------- Load more (pagination) ----------

  Future<void> _onLoadMoreChargingHistory(
      LoadMoreChargingHistory event, Emitter<ChargingState> emit) async {
    if (state.isLoadingMore || !state.hasMoreHistory) return;
    emit(state.copyWith(isLoadingMore: true, error: null));
    try {
      final nextPage = state.currentPage + 1;
      final more = await _repository.getChargingHistory(
        vin: event.vin,
        pageNo: nextPage,
        pageSize: _pageSize,
      );
      emit(state.copyWith(
        history: [...state.history, ...more],
        isLoadingMore: false,
        currentPage: nextPage,
        hasMoreHistory: more.length >= _pageSize,
      ));
    } catch (e) {
      emit(state.copyWith(isLoadingMore: false, error: e.toString()));
    }
  }

  // ---------- Business fleet sessions ----------

  Future<void> _onFetchBusinessSessions(
      FetchBusinessSessions event, Emitter<ChargingState> emit) async {
    try {
      final sessions = await _repository.getBusinessChargingSessions(
        vin: event.vin,
        dateFrom: event.dateFrom,
        dateTo: event.dateTo,
        limit: event.limit,
        offset: event.offset,
      );
      emit(state.copyWith(businessSessions: sessions));
    } catch (_) {
      // Fleet-only endpoint — silently ignore for personal accounts
    }
  }

  // ---------- Invoice download ----------

  Future<void> _onDownloadInvoice(
      DownloadInvoice event, Emitter<ChargingState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final bytes = await _repository.getChargingInvoice(event.contentId);
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/invoice_${event.contentId}.pdf');
      await file.writeAsBytes(bytes);
      final result = await OpenFile.open(file.path);
      if (result.type == ResultType.done) {
        emit(state.copyWith(isLoading: false, successMessage: 'Invoice opened.'));
      } else {
        debugPrint('OpenFile: ${result.message}');
        emit(state.copyWith(
            isLoading: false, successMessage: 'Invoice saved: ${file.path}'));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Invoice download failed: $e'));
    }
  }

  // ---------- Station selection ----------

  Future<void> _onSelectStation(
      SelectStation event, Emitter<ChargingState> emit) async {
    emit(state.copyWith(
        selectedStation: event.station, currentTariff: null, isLoading: true));
    try {
      final tariff =
          await _repository.getChargingTariffs(event.station.id);
      emit(state.copyWith(currentTariff: tariff, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  // ---------- Local Hive sessions ----------

  Future<void> _onLoadLocalSessions(
      LoadLocalSessions event, Emitter<ChargingState> emit) async {
    try {
      final sessions = await _localRepo.getSessionsList(event.vin);
      emit(state.copyWith(localSessions: sessions));
    } catch (_) {}
  }
}
