import 'package:flutter/material.dart';
import 'package:projeto_flutter/app_routes.dart';
import 'package:projeto_flutter/styles/theme_style.dart';
import 'package:provider/provider.dart';

import 'providers/config_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ConfigProvider storeConfig;

  @override
  Widget build(BuildContext context) {
    storeConfig = Provider.of<ConfigProvider>(context);
    return MaterialApp(
      title: 'School',
      routes: AppRoutes.routes(),
      themeMode: storeConfig.tema,
      theme: MyTheme.claro,
      darkTheme: MyTheme.escuro,
    );
  }
}
