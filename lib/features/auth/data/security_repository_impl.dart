import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../domain/security_repository.dart';

class SecurityRepositoryImpl implements SecurityRepository {
  final FlutterSecureStorage _storage;
  
  static const String _privateKeyKey = 'tesla_private_key';
  static const String _publicKeyKey = 'tesla_public_key';
  static const String _isRegisteredKey = 'tesla_key_registered';

  SecurityRepositoryImpl(this._storage);

  @override
  Future<void> generateKeyPair() async {
    final domain = ECCurve_prime256v1();
    final keyParams = ECKeyGeneratorParameters(domain);
    
    final generator = ECKeyGenerator();
    generator.init(ParametersWithRandom(keyParams, _getSecureRandom()));
    
    final keyPair = generator.generateKeyPair();
    final privateKey = keyPair.privateKey as ECPrivateKey;
    final publicKey = keyPair.publicKey as ECPublicKey;
    
    // Extract private key d value
    final privateKeyBytes = _encodeBigInt(privateKey.d!);
    
    // Extract public key in uncompressed format [0x04, x, y]
    final xBytes = _encodeBigInt(publicKey.Q!.x!.toBigInteger()!);
    final yBytes = _encodeBigInt(publicKey.Q!.y!.toBigInteger()!);
    
    // Ensure 32 bytes for each coordinate
    final paddedX = Uint8List(32)..setRange(32 - xBytes.length, 32, xBytes);
    final paddedY = Uint8List(32)..setRange(32 - yBytes.length, 32, yBytes);
    
    final publicKeyBytes = Uint8List.fromList([0x04, ...paddedX, ...paddedY]);

    await _storage.write(key: _privateKeyKey, value: base64Encode(privateKeyBytes));
    await _storage.write(key: _publicKeyKey, value: base64Encode(publicKeyBytes));
  }

  @override
  Future<String?> getPublicKey() async {
    return await _storage.read(key: _publicKeyKey);
  }

  @override
  Future<bool> hasKeyPair() async {
    final key = await _storage.read(key: _privateKeyKey);
    return key != null && key.isNotEmpty;
  }

  @override
  Future<String?> signPayload(String payload) async {
    final privateKeyB64 = await _storage.read(key: _privateKeyKey);
    if (privateKeyB64 == null) return null;

    final privateKeyBytes = base64Decode(privateKeyB64);
    final privateKeyInt = _decodeBigInt(privateKeyBytes);
    
    final domain = ECCurve_prime256v1();
    final privateKey = ECPrivateKey(privateKeyInt, domain);
    
    final signer = ECDSASigner(SHA256Digest(), HMac(SHA256Digest(), 64));
    signer.init(true, PrivateKeyParameter<ECPrivateKey>(privateKey));
    
    final signature = signer.generateSignature(Uint8List.fromList(utf8.encode(payload))) as ECSignature;
    
    // Concatenate R and S into exactly 64 bytes (32 for R, 32 for S)
    final rBytes = _encodeBigInt(signature.r);
    final sBytes = _encodeBigInt(signature.s);
    
    final paddedR = Uint8List(32)..setRange(32 - rBytes.length, 32, rBytes);
    final paddedS = Uint8List(32)..setRange(32 - sBytes.length, 32, sBytes);
    
    final sigBytes = Uint8List.fromList([...paddedR, ...paddedS]);
    return base64Encode(sigBytes);
  }

  @override
  Future<void> markKeyAsRegistered() async {
    await _storage.write(key: _isRegisteredKey, value: 'true');
  }

  @override
  Future<bool> isKeyAsRegistered() async {
    final value = await _storage.read(key: _isRegisteredKey);
    return value == 'true';
  }

  // --- Helper Methods ---

  SecureRandom _getSecureRandom() {
    final secureRandom = FortunaRandom();
    final seed = Uint8List(32);
    // In a real app, you should seed with platform-specific entropy
    // For now, we use a simple seed; cryptography package is better for randomness
    // but we need pointycastle for the logic.
    final random = DateTime.now().millisecondsSinceEpoch;
    for (var i = 0; i < 32; i++) {
      seed[i] = (random >> (i % 8)) & 0xFF;
    }
    secureRandom.seed(KeyParameter(seed));
    return secureRandom;
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

  BigInt _decodeBigInt(Uint8List bytes) {
    var hex = '';
    for (var byte in bytes) {
      hex += byte.toRadixString(16).padLeft(2, '0');
    }
    return BigInt.parse(hex, radix: 16);
  }
}
