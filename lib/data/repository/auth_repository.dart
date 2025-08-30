import 'package:flutter/widgets.dart';

import '../../util/result.dart';

abstract class AuthRepository extends ChangeNotifier {
  Future<bool> get isAuthenticated;

  Future<Result<void>> login({required String account, required String password});

  Future<Result<void>> logout();
}
