import '../../util/result.dart';
import '../shared_preferences_service.dart';
import 'auth_repository.dart';

class AuthRepositoryDev extends AuthRepository {
  AuthRepositoryDev({
    required SharedPreferencesService sharedPreferencesService,
  }) : _sharedPreferencesService = sharedPreferencesService;

  final SharedPreferencesService _sharedPreferencesService;

  @override
  Future<bool> get isAuthenticated async {
    final result = await _sharedPreferencesService.getToken();
    switch (result) {
      case Ok<String?>():
        return result.value != null;
      case Error<String?>():
    }
    return false;
  }

  @override
  Future<Result<void>> login({
    required String account,
    required String password,
  }) async {
    try {
      await Future.delayed(Duration(milliseconds: 400));
      if (account == '123456' && password == '123456') {
        return _sharedPreferencesService.setToken('token');
      }
      return Future.value(
        Result.error(Exception('Invalid account or password')),
      );
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<Result<void>> logout() {
    try {
      return _sharedPreferencesService.removeToken();
    } finally {
      notifyListeners();
    }
  }
}
