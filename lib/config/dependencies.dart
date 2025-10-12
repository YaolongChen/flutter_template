import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/auth_repository.dart';
import '../data/repository/auth_repository_dev.dart';
import '../data/repository/auth_repository_product.dart';
import '../data/shared_preferences_service.dart';

List<SingleChildWidget> get providersDev {
  return [
    Provider(create: (context) => SharedPreferencesAsync()),
    Provider(
      create: (context) =>
          SharedPreferencesService(sharedPreferences: context.read()),
    ),
    ChangeNotifierProvider(
      create: (context) =>
          AuthRepositoryDev(sharedPreferencesService: context.read())
              as AuthRepository,
    ),
  ];
}

List<SingleChildWidget> get providersProduct {
  return [
    Provider(create: (context) => SharedPreferencesAsync()),
    Provider(
      create: (context) =>
          SharedPreferencesService(sharedPreferences: context.read()),
    ),
    ChangeNotifierProvider(
      create: (context) =>
          AuthRepositoryProduct(sharedPreferencesService: context.read())
              as AuthRepository,
    ),
  ];
}
