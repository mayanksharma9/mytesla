import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'security_utils.dart';

import 'proto/universal_message.pb.dart';
import 'proto/signatures.pb.dart';
import 'proto/vcsec.pb.dart' as VCSEC hide SignatureType;
import 'proto/car_server.pb.dart' as CarServer;
import 'proto/common.pb.dart' as Common;

class TVCPSession {
  final Domain domain;
  int counter = 0;
  List<int>? epoch;
  int? clockDeltaSeconds;
  Uint8List? hmacKey;
  List<int>? vehiclePublicKey;

  TVCPSession(this.domain);

  bool get isReady => epoch != null && hmacKey != null && clockDeltaSeconds != null;

  void update(SessionInfo info, Uint8List derivedHmacKey) {
    counter = info.counter;
    epoch = info.epoch;
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    clockDeltaSeconds = now - info.clockTime;
    hmacKey = derivedHmacKey;
    vehiclePublicKey = info.publicKey;
  }
}

class TVCPSigner {
  final String vin;
  final Map<Domain, TVCPSession> _sessions = {
    Domain.DOMAIN_VEHICLE_SECURITY: TVCPSession(Domain.DOMAIN_VEHICLE_SECURITY),
    Domain.DOMAIN_INFOTAINMENT: TVCPSession(Domain.DOMAIN_INFOTAINMENT),
  };
  final List<int> _routingAddress;

  TVCPSigner(this.vin) : _routingAddress = _generateRandomBytes(16);

  static List<int> _generateRandomBytes(int length) {
    final random = Random.secure();
    return List<int>.generate(length, (_) => random.nextInt(256));
  }

  /// 1. Handshake Flow: Create the Request Message 
  Future<RoutableMessage> createSessionInfoRequest(Domain domain) async {
    final pubKeyBytes = SecurityUtils().publicKeyBytes;

    return RoutableMessage(
      toDestination: Destination(domain: domain),
      fromDestination: Destination(routingAddress: _routingAddress),
      uuid: _generateRandomBytes(16),
      sessionInfoRequest: SessionInfoRequest(publicKey: pubKeyBytes),
    );
  }

  /// 2. Handshake Flow: Process Response and establish Session
  Future<void> processSessionInfoResponse(Domain domain, RoutableMessage response) async {
    if (!response.hasSessionInfo()) {
      throw Exception('RoutableMessage does not contain session info');
    }

    final sessionInfoBytes = response.sessionInfo;

    final info = SessionInfo.fromBuffer(sessionInfoBytes);
    print('TVCPSigner[$vin]: proto-parsed status=${info.status}');

    // Only trust the proto-generated field 5 for the status check.
    // Field 7 exists in some firmware responses but is NOT the status field —
    // it is an unrelated varint that happens to equal 1, which previously
    // caused false-positive whitelist rejections even when the key was registered.
    if (info.status == Session_Info_Status.SESSION_INFO_STATUS_KEY_NOT_ON_WHITELIST) {
      throw Exception(
        'Key not on vehicle whitelist. '
        'Open https://tesla.com/_ak/thedevelopersharma.com in the Tesla app '
        'and tap your car to register the virtual key.',
      );
    }

    final vehiclePubKey = Uint8List.fromList(info.publicKey);
    final sharedSecret = SecurityUtils().deriveSharedSecret(vehiclePubKey);
    if (sharedSecret == null) throw Exception('Failed to derive shared secret');

    final hmac = Hmac(sha256, sharedSecret);
    final hmacKeyBytes = hmac.convert(utf8.encode('authenticated command'));
    
    _sessions[domain]!.update(info, Uint8List.fromList(hmacKeyBytes.bytes));
  }

  bool isSessionReady(Domain domain) {
    return _sessions[domain]!.isReady;
  }

  static Domain getDomainForCommand(String commandName) {
    switch (commandName) {
      case 'door_lock':
      case 'door_unlock':
      case 'actuate_trunk':
      case 'actuate_frunk':
        return Domain.DOMAIN_VEHICLE_SECURITY;
      case 'auto_conditioning_start':
      case 'auto_conditioning_stop':
      case 'set_temps':
      case 'set_climate_keeper_mode':
      case 'remote_seat_heater_request':
      case 'charge_start':
      case 'charge_stop':
      case 'set_charge_limit':
      case 'set_charging_amps':
      case 'charge_port_door_open':
      case 'charge_port_door_close':
      case 'set_scheduled_charging':
      case 'set_scheduled_departure':
      case 'honk_horn':
      case 'flash_lights':
      case 'set_sentry_mode':
      case 'set_valet_mode':
      case 'window_control':
      case 'media_toggle_playback':
      case 'media_next_track':
      case 'media_prev_track':
      case 'media_volume_up':
      case 'media_volume_down':
      case 'remote_boombox':
      case 'set_bioweapon_mode':
      case 'set_cabin_overheat_protection':
      case 'set_preconditioning_max':
      case 'remote_start_drive':
        return Domain.DOMAIN_INFOTAINMENT;
      default:
        return Domain.DOMAIN_INFOTAINMENT;
    }
  }

  /// 3. Sign Command
  Future<String> signCommand(String commandName, {Map<String, dynamic>? data}) async {
    Domain domain;
    List<int> payloadBytes;
    final params = data ?? {};

    // 1. Map Command to Protobuf and Domain
    switch (commandName) {
      // --- Security (VEHICLE_SECURITY domain) ---
      case 'door_unlock':
        domain = Domain.DOMAIN_VEHICLE_SECURITY;
        payloadBytes = VCSEC.UnsignedMessage(
          rKEAction: VCSEC.RKEAction_E.RKE_ACTION_UNLOCK,
        ).writeToBuffer();
        break;
      case 'door_lock':
        domain = Domain.DOMAIN_VEHICLE_SECURITY;
        payloadBytes = VCSEC.UnsignedMessage(
          rKEAction: VCSEC.RKEAction_E.RKE_ACTION_LOCK,
        ).writeToBuffer();
        break;
      case 'actuate_trunk':
        domain = Domain.DOMAIN_VEHICLE_SECURITY;
        final which = params['which_trunk'] ?? 'rear';
        final action = which == 'front' 
          ? VCSEC.RKEAction_E.RKE_ACTION_OPEN_FRUNK 
          : VCSEC.RKEAction_E.RKE_ACTION_OPEN_TRUNK;
        payloadBytes = VCSEC.UnsignedMessage(
          rKEAction: action,
        ).writeToBuffer();
        break;
      case 'actuate_frunk':
        domain = Domain.DOMAIN_VEHICLE_SECURITY;
        payloadBytes = VCSEC.UnsignedMessage(
          rKEAction: VCSEC.RKEAction_E.RKE_ACTION_OPEN_FRUNK,
        ).writeToBuffer();
        break;

      // --- Climate (INFOTAINMENT domain) ---
      case 'auto_conditioning_start':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          hvacAutoAction: CarServer.HvacAutoAction(powerOn: true),
        ).writeToBuffer();
        break;
      case 'auto_conditioning_stop':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          hvacAutoAction: CarServer.HvacAutoAction(powerOn: false),
        ).writeToBuffer();
        break;
      case 'set_temps':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          hvacTemperatureAdjustmentAction: CarServer.HvacTemperatureAdjustmentAction(
            driverTempCelsius: (params['driver_temp'] ?? 22.0).toDouble(),
            passengerTempCelsius: (params['passenger_temp'] ?? 22.0).toDouble(),
          ),
        ).writeToBuffer();
        break;
      case 'remote_seat_heater_request':
        domain = Domain.DOMAIN_INFOTAINMENT;
        final heaterIdx = params['heater'] ?? 0;
        final level = params['level'] ?? 0;
        
        final action = CarServer.HvacSeatHeaterActions_HvacSeatHeaterAction();
        _setSeatHeaterLevel(action, level);
        _setSeatHeaterPosition(action, heaterIdx);

        payloadBytes = CarServer.VehicleAction(
          hvacSeatHeaterActions: CarServer.HvacSeatHeaterActions(
            hvacSeatHeaterAction: [action],
          ),
        ).writeToBuffer();
        break;

      // --- Charging (INFOTAINMENT domain) ---
      case 'charge_start':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          chargingStartStopAction: CarServer.ChargingStartStopAction(start: Common.Void()),
        ).writeToBuffer();
        break;
      case 'charge_stop':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          chargingStartStopAction: CarServer.ChargingStartStopAction(stop: Common.Void()),
        ).writeToBuffer();
        break;
      case 'set_charge_limit':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          chargingSetLimitAction: CarServer.ChargingSetLimitAction(percent: params['percent'] ?? 80),
        ).writeToBuffer();
        break;
      case 'charge_port_door_open':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          chargePortDoorOpen: CarServer.ChargePortDoorOpen(),
        ).writeToBuffer();
        break;
      case 'charge_port_door_close':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          chargePortDoorClose: CarServer.ChargePortDoorClose(),
        ).writeToBuffer();
        break;

      // --- Alerts (INFOTAINMENT domain) ---
      case 'honk_horn':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          vehicleControlHonkHornAction: CarServer.VehicleControlHonkHornAction(),
        ).writeToBuffer();
        break;
      case 'flash_lights':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          vehicleControlFlashLightsAction: CarServer.VehicleControlFlashLightsAction(),
        ).writeToBuffer();
        break;
      
      // --- Security System ---
      case 'set_sentry_mode':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          vehicleControlSetSentryModeAction: CarServer.VehicleControlSetSentryModeAction(on: params['on'] ?? false),
        ).writeToBuffer();
        break;

      case 'set_charging_amps':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          setChargingAmpsAction: CarServer.SetChargingAmpsAction(chargingAmps: params['charging_amps'] ?? 16),
        ).writeToBuffer();
        break;

      case 'set_valet_mode':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          vehicleControlSetValetModeAction: CarServer.VehicleControlSetValetModeAction(
            on: params['on'] ?? false,
            password: params['password'] as String? ?? '',
          ),
        ).writeToBuffer();
        break;

      case 'set_climate_keeper_mode':
        domain = Domain.DOMAIN_INFOTAINMENT;
        final mode = params['climate_keeper_mode'] as String? ?? 'off';
        CarServer.HvacClimateKeeperAction_ClimateKeeperAction_E keeperMode;
        switch (mode) {
          case 'dog':
            keeperMode = CarServer.HvacClimateKeeperAction_ClimateKeeperAction_E.ClimateKeeperAction_Dog;
            break;
          case 'camp':
            keeperMode = CarServer.HvacClimateKeeperAction_ClimateKeeperAction_E.ClimateKeeperAction_Camp;
            break;
          case 'on':
            keeperMode = CarServer.HvacClimateKeeperAction_ClimateKeeperAction_E.ClimateKeeperAction_On;
            break;
          default:
            keeperMode = CarServer.HvacClimateKeeperAction_ClimateKeeperAction_E.ClimateKeeperAction_Off;
        }
        payloadBytes = CarServer.VehicleAction(
          hvacClimateKeeperAction: CarServer.HvacClimateKeeperAction(
            climateKeeperAction: keeperMode,
          ),
        ).writeToBuffer();
        break;

      case 'window_control':
        domain = Domain.DOMAIN_INFOTAINMENT;
        final windowCmd = params['command'] as String? ?? 'vent';
        payloadBytes = CarServer.VehicleAction(
          vehicleControlWindowAction: windowCmd == 'close'
              ? CarServer.VehicleControlWindowAction(close: Common.Void())
              : CarServer.VehicleControlWindowAction(vent: Common.Void()),
        ).writeToBuffer();
        break;

      case 'set_scheduled_charging':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          scheduledChargingAction: CarServer.ScheduledChargingAction(
            enabled: params['enable'] as bool? ?? false,
            chargingTime: params['time'] as int? ?? 0,
          ),
        ).writeToBuffer();
        break;

      case 'set_scheduled_departure':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          scheduledDepartureAction: CarServer.ScheduledDepartureAction(
            enabled: params['enable'] as bool? ?? false,
            departureTime: params['departure_time'] as int? ?? 0,
          ),
        ).writeToBuffer();
        break;

      // --- Media ---
      case 'media_toggle_playback':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          mediaPlayAction: CarServer.MediaPlayAction(),
        ).writeToBuffer();
        break;
      case 'media_next_track':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          mediaNextTrack: CarServer.MediaNextTrack(),
        ).writeToBuffer();
        break;
      case 'media_prev_track':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          mediaPreviousTrack: CarServer.MediaPreviousTrack(),
        ).writeToBuffer();
        break;
      case 'media_volume_up':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          mediaUpdateVolume: CarServer.MediaUpdateVolume(volumeDelta: 1),
        ).writeToBuffer();
        break;
      case 'media_volume_down':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          mediaUpdateVolume: CarServer.MediaUpdateVolume(volumeDelta: -1),
        ).writeToBuffer();
        break;

      // --- Extra Climate ---
      case 'set_bioweapon_mode':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          hvacBioweaponModeAction: CarServer.HvacBioweaponModeAction(
            on: params['on'] as bool? ?? false,
            manualOverride: params['manual_override'] as bool? ?? false,
          ),
        ).writeToBuffer();
        break;
      case 'set_cabin_overheat_protection':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          setCabinOverheatProtectionAction: CarServer.SetCabinOverheatProtectionAction(
            on: params['on'] as bool? ?? false,
            fanOnly: params['fan_only'] as bool? ?? false,
          ),
        ).writeToBuffer();
        break;
      case 'set_preconditioning_max':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          hvacSetPreconditioningMaxAction: CarServer.HvacSetPreconditioningMaxAction(
            on: params['on'] as bool? ?? false,
            manualOverride: params['manual_override'] as bool? ?? false,
          ),
        ).writeToBuffer();
        break;

      // --- Remote Start ---
      case 'remote_start_drive':
        domain = Domain.DOMAIN_VEHICLE_SECURITY;
        payloadBytes = VCSEC.UnsignedMessage(
          rKEAction: VCSEC.RKEAction_E.RKE_ACTION_REMOTE_DRIVE,
        ).writeToBuffer();
        break;

      // --- Boombox ---
      case 'remote_boombox':
        domain = Domain.DOMAIN_INFOTAINMENT;
        payloadBytes = CarServer.VehicleAction(
          boomboxAction: CarServer.BoomboxAction(sound: params['sound'] as int? ?? 0),
        ).writeToBuffer();
        break;

      default:
        throw UnimplementedError('Command $commandName not yet supported for TVCP signed command in proxy');
    }

    final session = _sessions[domain]!;
    
    if (!session.isReady) {
      throw Exception('Session not ready for $domain. Handshake may be required.');
    }

    // Prepare metadata
    session.counter += 1;
    final now = (DateTime.now().millisecondsSinceEpoch / 1000).round();
    final expiresAt = now - session.clockDeltaSeconds! + 30; // 30s window in vehicle time

    final hmacData = HMAC_Personalized_Signature_Data(
      epoch: session.epoch,
      counter: session.counter,
      expiresAt: expiresAt,
    );

    final metadata = BytesBuilder();
    metadata.add([Tag.TAG_SIGNATURE_TYPE.value, 1, SignatureType.SIGNATURE_TYPE_HMAC_PERSONALIZED.value]);
    metadata.add([Tag.TAG_DOMAIN.value, 1, domain.value]);
    
    final vinBytes = utf8.encode(vin);
    metadata.add([Tag.TAG_PERSONALIZATION.value, vinBytes.length]);
    metadata.add(vinBytes);

    metadata.add([Tag.TAG_EPOCH.value, session.epoch!.length]);
    metadata.add(session.epoch!);

    metadata.add([Tag.TAG_EXPIRES_AT.value, 4]);
    metadata.add(_uint32ToBytes(expiresAt));

    metadata.add([Tag.TAG_COUNTER.value, 4]);
    metadata.add(_uint32ToBytes(session.counter));

    metadata.add([Tag.TAG_END.value]);

    final metadataBytes = metadata.toBytes();
    
    final hmac = Hmac(sha256, session.hmacKey!);
    final tagBuilder = BytesBuilder();
    tagBuilder.add(metadataBytes);
    tagBuilder.add(payloadBytes);
    final tagDigest = hmac.convert(tagBuilder.toBytes());

    hmacData.tag = tagDigest.bytes;

    final pubKeyB64 = SecurityUtils().publicKey;
    final pubKeyBytes = base64Decode(pubKeyB64);

    final signatureData = SignatureData(
      signerIdentity: KeyIdentity(publicKey: pubKeyBytes),
      hMACPersonalizedData: hmacData,
    );

    final routableMessage = RoutableMessage(
      toDestination: Destination(domain: domain),
      fromDestination: Destination(routingAddress: _routingAddress),
      protobufMessageAsBytes: payloadBytes,
      uuid: _generateRandomBytes(16),
      signatureData: signatureData,
    );

    return base64Encode(routableMessage.writeToBuffer());
  }

  static void _setSeatHeaterLevel(CarServer.HvacSeatHeaterActions_HvacSeatHeaterAction action, int level) {
    switch (level) {
      case 0: action.sEATHEATEROFF = Common.Void(); break;
      case 1: action.sEATHEATERLOW = Common.Void(); break;
      case 2: action.sEATHEATERMED = Common.Void(); break;
      case 3: action.sEATHEATERHIGH = Common.Void(); break;
      default: action.sEATHEATERUNKNOWN = Common.Void();
    }
  }

  static void _setSeatHeaterPosition(CarServer.HvacSeatHeaterActions_HvacSeatHeaterAction action, int index) {
    switch (index) {
      case 0: action.cARSEATFRONTLEFT = Common.Void(); break;
      case 1: action.cARSEATFRONTRIGHT = Common.Void(); break;
      case 2: action.cARSEATREARLEFT = Common.Void(); break;
      case 3: action.cARSEATREARCENTER = Common.Void(); break;
      case 4: action.cARSEATREARRIGHT = Common.Void(); break;
      case 5: action.cARSEATTHIRDROWLEFT = Common.Void(); break;
      case 6: action.cARSEATTHIRDROWRIGHT = Common.Void(); break;
      default: action.cARSEATUNKNOWN = Common.Void();
    }
  }

  static List<int> _uint32ToBytes(int value) {
    final bytes = Uint8List(4);
    final data = ByteData.view(bytes.buffer);
    data.setUint32(0, value, Endian.big);
    return bytes;
  }

}
