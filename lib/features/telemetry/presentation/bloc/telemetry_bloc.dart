import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/repositories/telemetry_repository.dart';
import '../../data/models/telemetry_models.dart';

// States
enum TelemetryStatus { initial, loading, success, error }

class TelemetryState extends Equatable {
  final TelemetryStatus status;
  final String? error;
  final Map<String, TelemetryFieldConfig> selectedFields;

  const TelemetryState({
    this.status = TelemetryStatus.initial,
    this.error,
    this.selectedFields = const {
      'VehicleSpeed': TelemetryFieldConfig(intervalSeconds: 10),
      'Location': TelemetryFieldConfig(intervalSeconds: 10),
      'Soc': TelemetryFieldConfig(intervalSeconds: 60),
    },
  });

  @override
  List<Object?> get props => [status, error, selectedFields];

  TelemetryState copyWith({
    TelemetryStatus? status,
    String? error,
    Map<String, TelemetryFieldConfig>? selectedFields,
  }) {
    return TelemetryState(
      status: status ?? this.status,
      error: error ?? this.error,
      selectedFields: selectedFields ?? this.selectedFields,
    );
  }
}

// Events
abstract class TelemetryEvent extends Equatable {
  const TelemetryEvent();

  @override
  List<Object?> get props => [];
}

class UpdateFieldConfig extends TelemetryEvent {
  final String fieldName;
  final TelemetryFieldConfig? config; // null to remove

  const UpdateFieldConfig(this.fieldName, this.config);

  @override
  List<Object?> get props => [fieldName, config];
}

class ConfigureTelemetryRequested extends TelemetryEvent {
  final String vehicleId;
  final String hostname;
  final String? ca;

  const ConfigureTelemetryRequested({
    required this.vehicleId,
    required this.hostname,
    this.ca,
  });

  @override
  List<Object?> get props => [vehicleId, hostname, ca];
}

// Bloc
class TelemetryBloc extends Bloc<TelemetryEvent, TelemetryState> {
  final TelemetryRepository _telemetryRepository;

  TelemetryBloc(this._telemetryRepository) : super(const TelemetryState()) {
    on<UpdateFieldConfig>(_onUpdateFieldConfig);
    on<ConfigureTelemetryRequested>(_onConfigureTelemetryRequested);
  }

  void _onUpdateFieldConfig(UpdateFieldConfig event, Emitter<TelemetryState> emit) {
    final newFields = Map<String, TelemetryFieldConfig>.from(state.selectedFields);
    if (event.config == null) {
      newFields.remove(event.fieldName);
    } else {
      newFields[event.fieldName] = event.config!;
    }
    emit(state.copyWith(selectedFields: newFields));
  }

  Future<void> _onConfigureTelemetryRequested(
    ConfigureTelemetryRequested event,
    Emitter<TelemetryState> emit,
  ) async {
    emit(state.copyWith(status: TelemetryStatus.loading));
    
    final success = await _telemetryRepository.configureTelemetry(
      vehicleId: event.vehicleId,
      hostname: event.hostname,
      fields: state.selectedFields,
      ca: event.ca,
    );

    if (success) {
      emit(state.copyWith(status: TelemetryStatus.success));
    } else {
      emit(state.copyWith(status: TelemetryStatus.error, error: 'Failed to configure telemetry'));
    }
  }
}
