import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/repository/auth_repository.dart';
import '../data/repository/auth_repository_dev.dart';
import '../data/repository/auth_repository_product.dart';

List<SingleChildWidget> get providersDev {
  return [
    ChangeNotifierProvider(
      create: (context) => AuthRepositoryDev() as AuthRepository,
    ),
  ];
}

List<SingleChildWidget> get providersProduct {
  return [
    ChangeNotifierProvider(
      create: (context) => AuthRepositoryProduct() as AuthRepository,
    ),
  ];
}
