import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';
import 'main.dart';

void main() {
  runApp(MultiProvider(providers: providersDev, child: MainApp()));
}
