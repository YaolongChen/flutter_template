import '../../../data/repository/auth_repository.dart';
import '../../../util/command.dart';
import '../../../util/result.dart';

class LoginViewModel {
  LoginViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    login = Command1<void, (String, String)>(_login);
  }

  final AuthRepository _authRepository;

  late Command1<void, (String, String)> login;

  Future<Result<void>> _login((String, String) credentials) async {
    final (account, password) = credentials;
    final result = await _authRepository.login(
      account: account,
      password: password,
    );
    return result;
  }
}