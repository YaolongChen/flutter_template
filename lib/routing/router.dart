import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/repository/auth_repository.dart';
import '../ui/home/view_model/home_view_model.dart';
import '../ui/home/widget/home_screen.dart';
import '../ui/login/view_model/login_view_model.dart';
import '../ui/login/widget/login_screen.dart';
import 'routes.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
  refreshListenable: authRepository,
  initialLocation: Routes.home,
  redirect: _redirect,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return HomeScreen(viewModel: HomeViewModel());
      },
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen(viewModel: LoginViewModel());
      },
    ),
  ],
);

FutureOr<String?> _redirect(BuildContext context, GoRouterState state) async {
  final isAuthenticated = await context.read<AuthRepository>().isAuthenticated;
  final isLoggingIn = state.matchedLocation == Routes.login;
  if (!isAuthenticated) {
    return Routes.login;
  }

  if (isLoggingIn) {
    return Routes.home;
  }

  return null;
}
