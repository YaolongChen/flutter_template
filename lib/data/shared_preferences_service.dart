import 'package:shared_preferences/shared_preferences.dart';

import '../util/result.dart';

class SharedPreferencesService {
  static const _tokenKey = 'token';

  SharedPreferencesService({required SharedPreferencesAsync sharedPreferences})
    : _sharedPreferences = sharedPreferences;

  final SharedPreferencesAsync _sharedPreferences;

  Future<Result<String?>> getToken() async {
    try {
      final token = await _sharedPreferences.getString(_tokenKey);
      return Result.ok(token);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> setToken(String token) async {
    try {
      await _sharedPreferences.setString(_tokenKey, token);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> removeToken() async {
    try {
      await _sharedPreferences.remove(_tokenKey);
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
