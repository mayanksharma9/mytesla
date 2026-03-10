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

class SelectStation extends ChargingEvent {
  final ChargingLocation station;
  const SelectStation(this.station);

  @override
  List<Object?> get props => [station];
}

// --- State ---
class ChargingState extends Equatable {
  final List<ChargingLocation> stations;
  final ChargingLocation? selectedStation;
  final ChargingTariff? currentTariff;
  final bool isLoading;
  final String? error;

  const ChargingState({
    this.stations = const [],
    this.selectedStation,
    this.currentTariff,
    this.isLoading = false,
    this.error,
  });

  ChargingState copyWith({
    List<ChargingLocation>? stations,
    ChargingLocation? selectedStation,
    ChargingTariff? currentTariff,
    bool? isLoading,
    String? error,
  }) {
    return ChargingState(
      stations: stations ?? this.stations,
      selectedStation: selectedStation ?? this.selectedStation,
      currentTariff: currentTariff ?? this.currentTariff,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [stations, selectedStation, currentTariff, isLoading, error];
}

// --- Bloc ---
class ChargingBloc extends Bloc<ChargingEvent, ChargingState> {
  final ChargingRepository _repository;

  ChargingBloc(this._repository) : super(const ChargingState()) {
    on<FetchNearbyStations>(_onFetchNearbyStations);
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
