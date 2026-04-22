import 'package:flutter_dotenv/flutter_dotenv.dart';

class TeslaConfig {
  // =========================================================================
  // APP-LEVEL CONFIGURATION (from .env file)
  // =========================================================================
  
  // 1. Your Application's Client ID
  static String get clientId => dotenv.env['TESLA_CLIENT_ID'] ?? 'YOUR_CLIENT_ID'; 
  
  // 2. Your Application's Client Secret
  static String get clientSecret => dotenv.env['TESLA_CLIENT_SECRET'] ?? 'YOUR_CLIENT_SECRET'; 
  
  // 3. Your Application's Redirect URI
  static String get callbackUrl => dotenv.env['TESLA_CALLBACK_URL'] ?? 'com.voltride://auth/callback';
  
  static const String callbackScheme = 'com.voltride';
  
  // Tesla Auth Endpoints
  static const String authUrl = 'https://auth.tesla.com/oauth2/v3/authorize';
  static const String tokenUrl = 'https://auth.tesla.com/oauth2/v3/token';
  
  // Scopes required for the app.
  // vehicle_location is required for location_data in vehicle_data and Fleet
  // Telemetry Location field. If the current token lacks this scope the user
  // must log out and back in to obtain a new token.
  static const List<String> scopes = [
    'openid',
    'offline_access',
    'user_data',
    'vehicle_device_data',
    'vehicle_location',
    'vehicle_cmds',
    'vehicle_charging_cmds',
    'charging_history',
    'charging_sessions',
  ];

  static String get scopeString => scopes.join(' ');

  // The domain verified with Tesla for Virtual Key registration
  static String get developerDomain => dotenv.env['TESLA_DEVELOPER_DOMAIN'] ?? 'voltride.com';
  
  // URL of our custom TVCP signing proxy backend (Shelf/Cloud Run)
  static String get proxyUrl => dotenv.env['TESLA_PROXY_URL'] ?? 'http://10.0.2.2:8081';

  // Hostname for Fleet Telemetry registration (no https://, e.g. voltride-proxy-xxxx-uc.a.run.app)
  // Set this after deploying to Cloud Run and then re-build the app.
  static String? get fleetTelemetryHostname => dotenv.env['FLEET_TELEMETRY_HOSTNAME'];

  // Audience for Fleet API
  static const String audience = 'https://fleet-api.prd.na.vn.cloud.tesla.com';
}
