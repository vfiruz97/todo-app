import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SettingsService {
  const SettingsService(this._prefs);

  final SharedPreferences _prefs;

  static const String _serverUrlKey = 'server_url';
  static const String _defaultServerUrl = 'http://localhost:8080';

  String get serverUrl => _prefs.getString(_serverUrlKey) ?? _defaultServerUrl;

  Future<bool> setServerUrl(String url) async {
    return await _prefs.setString(_serverUrlKey, url);
  }

  Future<bool> resetServerUrl() async {
    return await _prefs.remove(_serverUrlKey);
  }

  bool get isDefaultServerUrl => serverUrl == _defaultServerUrl;
}

@module
abstract class SettingsModule {
  @preResolve
  @injectable
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
