import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:voltride/features/dashboard/data/models/tesla_models.dart';
import 'package:voltride/features/charging/domain/charging_repository.dart';

// --- Events ---
abstract class ChargingEvent extends Equatable {
  const ChargingEvent();

  @override
  List<Object?> get props => [];
}

class FetchNearbyStations extends ChargingEvent {}

class FetchChargingHistory extends ChargingEvent {
  final bool refresh;
  const FetchChargingHistory({this.refresh = false});

  @override
  List<Object?> get props => [refresh];
}

class LoadMoreChargingHistory extends ChargingEvent {}

class FetchBusinessSessions extends ChargingEvent {}

class DownloadInvoice extends ChargingEvent {
  final String sessionId;
  const DownloadInvoice(this.sessionId);

  @override
  List<Object?> get props => [sessionId];
}

class SelectStation extends ChargingEvent {
  final ChargingLocation station;
  const SelectStation(this.station);

  @override
  List<Object?> get props => [station];
}

// --- State ---
class ChargingState extends Equatable {
  final List<ChargingLocation> stations;
  final List<ChargingHistoryEntry> history;
  final List<ChargingSessionInfo> businessSessions;
  final ChargingLocation? selectedStation;
  final ChargingTariff? currentTariff;
  final bool isLoading;
  final bool isPaginationLoading;
  final bool hasMoreHistory;
  final int currentPage;
  final String? error;
  final String? successMessage;

  const ChargingState({
    this.stations = const [],
    this.history = const [],
    this.businessSessions = const [],
    this.selectedStation,
    this.currentTariff,
    this.isLoading = false,
    this.isPaginationLoading = false,
    this.hasMoreHistory = true,
    this.currentPage = 1,
    this.error,
    this.successMessage,
  });

  ChargingState copyWith({
    List<ChargingLocation>? stations,
    List<ChargingHistoryEntry>? history,
    List<ChargingSessionInfo>? businessSessions,
    ChargingLocation? selectedStation,
    ChargingTariff? currentTariff,
    bool? isLoading,
    bool? isPaginationLoading,
    bool? hasMoreHistory,
    int? currentPage,
    String? error,
    String? successMessage,
  }) {
    return ChargingState(
      stations: stations ?? this.stations,
      history: history ?? this.history,
      businessSessions: businessSessions ?? this.businessSessions,
      selectedStation: selectedStation ?? this.selectedStation,
      currentTariff: currentTariff ?? this.currentTariff,
      isLoading: isLoading ?? this.isLoading,
      isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      hasMoreHistory: hasMoreHistory ?? this.hasMoreHistory,
      currentPage: currentPage ?? this.currentPage,
      error: error,
      successMessage: successMessage,
    );
  }

  @override
  List<Object?> get props => [
        stations,
        history,
        businessSessions,
        selectedStation,
        currentTariff,
        isLoading,
        isPaginationLoading,
        hasMoreHistory,
        currentPage,
        error,
        successMessage,
      ];
}

// --- Bloc ---
class ChargingBloc extends Bloc<ChargingEvent, ChargingState> {
  final ChargingRepository _repository;

  ChargingBloc(this._repository) : super(const ChargingState()) {
    on<FetchNearbyStations>(_onFetchNearbyStations);
    on<FetchChargingHistory>(_onFetchChargingHistory);
    on<LoadMoreChargingHistory>(_onLoadMoreChargingHistory);
    on<FetchBusinessSessions>(_onFetchBusinessSessions);
    on<DownloadInvoice>(_onDownloadInvoice);
    on<SelectStation>(_onSelectStation);
  }

  Future<void> _onFetchNearbyStations(FetchNearbyStations event, Emitter<ChargingState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final stations = await _repository.getChargingLocations();
      emit(state.copyWith(stations: stations, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onFetchChargingHistory(FetchChargingHistory event, Emitter<ChargingState> emit) async {
    emit(state.copyWith(isLoading: true, error: null, currentPage: 1, hasMoreHistory: true));
    try {
      final history = await _repository.getChargingHistory(page: 1, perPage: 20);
      emit(state.copyWith(
        history: history,
        isLoading: false,
        hasMoreHistory: history.length >= 20,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onLoadMoreChargingHistory(LoadMoreChargingHistory event, Emitter<ChargingState> emit) async {
    if (state.isPaginationLoading || !state.hasMoreHistory) return;

    emit(state.copyWith(isPaginationLoading: true, error: null));
    try {
      final nextPage = state.currentPage + 1;
      final moreHistory = await _repository.getChargingHistory(page: nextPage, perPage: 20);
      
      emit(state.copyWith(
        history: [...state.history, ...moreHistory],
        isPaginationLoading: false,
        currentPage: nextPage,
        hasMoreHistory: moreHistory.length >= 20,
      ));
    } catch (e) {
      emit(state.copyWith(isPaginationLoading: false, error: e.toString()));
    }
  }

  Future<void> _onFetchBusinessSessions(FetchBusinessSessions event, Emitter<ChargingState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final sessions = await _repository.getBusinessChargingSessions();
      emit(state.copyWith(businessSessions: sessions, isLoading: false));
    } catch (e) {
      // businessSessions might fail for personal accounts, handle gracefully or keep empty
      emit(state.copyWith(isLoading: false, error: "Business sessions only available for fleet owners."));
    }
  }

  Future<void> _onDownloadInvoice(DownloadInvoice event, Emitter<ChargingState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await _repository.getChargingInvoice(event.sessionId);
      // In a real app, we'd save/open the PDF here. 
      // For now we just verify we can fetch it.
      emit(state.copyWith(isLoading: false, successMessage: "Invoice downloaded successfully."));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Failed to download invoice: ${e.toString()}"));
    }
  }

  Future<void> _onSelectStation(SelectStation event, Emitter<ChargingState> emit) async {
    emit(state.copyWith(selectedStation: event.station, currentTariff: null, isLoading: true));
    try {
      final tariff = await _repository.getChargingTariffs(event.station.id);
      emit(state.copyWith(currentTariff: tariff, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
