import 'package:cloud_functions/cloud_functions.dart';


class FunctionsClient {
final FirebaseFunctions _fn = FirebaseFunctions.instance;


// Auth
Future<Map<String, dynamic>> beginTeslaOauth() async {
final res = await _fn.httpsCallable('beginTeslaOauth').call();
return Map<String, dynamic>.from(res.data as Map);
}


Future<Map<String, dynamic>> completeTeslaOauth({required String code}) async {
final res = await _fn.httpsCallable('completeTeslaOauth').call({ 'code': code });
return Map<String, dynamic>.from(res.data as Map);
}


Future<Map<String, dynamic>> linkVirtualKey({required String vin}) async {
final res = await _fn.httpsCallable('linkVirtualKey').call({ 'vin': vin });
return Map<String, dynamic>.from(res.data as Map);
}


// Proxy vehicle commands (server signs)
Future<Map<String, dynamic>> sendCommand({required String tag, required String command, Map<String, dynamic>? args}) async {
final res = await _fn.httpsCallable('vehicleCommand').call({ 'tag': tag, 'command': command, 'args': args ?? {} });
return Map<String, dynamic>.from(res.data as Map);
}


// Read device data snapshot safely via backend
Future<Map<String, dynamic>> getDeviceData({required String tag}) async {
final res = await _fn.httpsCallable('getDeviceData').call({ 'tag': tag });
return Map<String, dynamic>.from(res.data as Map);
}
}