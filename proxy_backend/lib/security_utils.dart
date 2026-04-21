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
}
