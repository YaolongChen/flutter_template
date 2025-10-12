import 'package:flutter/material.dart';

import '../../../data/repository/auth_repository.dart';
import '../../../util/command.dart';
import '../../../util/result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    logout = Command0(_logout);
  }

  final AuthRepository _authRepository;

  late Command0<void> logout;

  Future<Result<void>> _logout() async {
    final result = await _authRepository.logout();
    return result;
  }
}
