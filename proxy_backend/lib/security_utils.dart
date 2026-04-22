import 'dart:math';
import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/export.dart';
import 'package:dotenv/dotenv.dart';

class SecurityUtils {
  static final SecurityUtils _instance = SecurityUtils._internal();
  factory SecurityUtils() => _instance;
  SecurityUtils._internal();

  ECPrivateKey? _privateKey;
  Uint8List? _publicKeyBytes;

  void init(DotEnv env) {
    final dHex = env['TESLA_PRIVATE_KEY_HEX'];
    if (dHex == null) {
      throw Exception('Missing TESLA_PRIVATE_KEY_HEX in .env');
    }
    
    final domain = ECCurve_prime256v1();
    final d = BigInt.parse(dHex, radix: 16);
    _privateKey = ECPrivateKey(d, domain);
    
    // Derive public key point: Q = d * G
    final q = domain.G * d;
    if (q == null) throw Exception('Failed to derive public key');
    
    // Get raw 65-byte uncompressed point
    _publicKeyBytes = q.getEncoded(false);
  }

  Uint8List get publicKeyBytes => _publicKeyBytes!;
  String get publicKey => base64Encode(_publicKeyBytes!);

  Uint8List? deriveSharedSecret(Uint8List peerPublicKey) {
    if (_privateKey == null) return null;

    final domain = ECCurve_prime256v1();
    final peerPubKeyPoint = domain.curve.decodePoint(peerPublicKey);
    final peerPubKey = ECPublicKey(peerPubKeyPoint, domain);

    final ecdh = ECDHBasicAgreement()..init(_privateKey!);
    final agreement = ecdh.calculateAgreement(peerPubKey);

    // Tesla TVCP shared secret = raw 32-byte X-coordinate of the ECDH result.
    // The caller then derives the HMAC key as HMAC-SHA256(sharedSecret, "authenticated command").
    // Do NOT hash with SHA1 here — that was producing a wrong key.
    final xBytes = _encodeBigInt(agreement);
    return Uint8List(32)..setRange(32 - xBytes.length, 32, xBytes);
  }

  Uint8List _encodeBigInt(BigInt number) {
    var hex = number.toRadixString(16);
    if (hex.length % 2 != 0) hex = '0$hex';
    final bytes = Uint8List(hex.length ~/ 2);
    for (var i = 0; i < bytes.length; i++) {
      bytes[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
    }
    return bytes;
  }

  // ---------------------------------------------------------------------------
  // JWS signing for Fleet Telemetry config (ES256 = ECDSA P-256 + SHA-256)
  // ---------------------------------------------------------------------------
  //
  // Tesla's fleet_telemetry_config_jws endpoint expects a compact JWS token
  // signed by the registered application key (same private key used for TVCP).
  // The JWS uses the standard ES256 algorithm: ECDSA over P-256 with SHA-256,
  // and the signature is encoded in IEEE P1363 format (R || S, 32 bytes each).
  //
  // Usage: build the config map (hostname, ca, fields, port, exp) and pass it
  // to this method. The returned compact token can be sent directly to Tesla.

  String signFleetConfigJws(Map<String, dynamic> config) {
    if (_privateKey == null) throw StateError('SecurityUtils not initialised');

    // JWS Compact Serialization: base64url(header).base64url(payload).base64url(sig)
    final headerB64 = _b64u(utf8.encode(jsonEncode({'alg': 'ES256', 'typ': 'JWT'})));
    final payloadB64 = _b64u(utf8.encode(jsonEncode(config)));
    final signingInput = '$headerB64.$payloadB64';

    // Sign with ECDSA + SHA-256
    final signer = ECDSASigner(SHA256Digest())
      ..init(
        true,
        ParametersWithRandom(
          PrivateKeyParameter<ECPrivateKey>(_privateKey!),
          _buildSecureRandom(),
        ),
      );
    final sig = signer.generateSignature(
      Uint8List.fromList(utf8.encode(signingInput)),
    ) as ECSignature;

    // Encode as IEEE P1363: fixed 32-byte big-endian R followed by S
    final sigBytes = Uint8List(64)
      ..setRange(0, 32, _bigIntToFixed32(sig.r))
      ..setRange(32, 64, _bigIntToFixed32(sig.s));

    return '$headerB64.$payloadB64.${_b64u(sigBytes)}';
  }

  // base64url without padding
  static String _b64u(List<int> bytes) =>
      base64Url.encode(bytes).replaceAll('=', '');

  // Encode a BigInt as a fixed 32-byte big-endian array
  static Uint8List _bigIntToFixed32(BigInt n) {
    var hex = n.toRadixString(16);
    if (hex.length % 2 != 0) hex = '0$hex';
    final raw = Uint8List(hex.length ~/ 2);
    for (var i = 0; i < raw.length; i++) {
      raw[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
    }
    final out = Uint8List(32);
    out.setRange(32 - raw.length, 32, raw);
    return out;
  }

  static SecureRandom _buildSecureRandom() {
    final rng = Random.secure();
    final seed = Uint8List(32);
    for (var i = 0; i < 32; i++) seed[i] = rng.nextInt(256);
    return FortunaRandom()..seed(KeyParameter(seed));
  }
}
