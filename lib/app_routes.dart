import 'package:flutter/material.dart';
import 'package:projeto_flutter/pages/detalhe/detalhe_page.dart';
import 'package:projeto_flutter/pages/home/home_page.dart';

class AppRoutes {
  static String initialRoute = '/';
  static String detalhe = '/detalheItem';

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      initialRoute: (context) => const Homepage(),
      detalhe: (context) => const DetalhePage(),
    };
  }
}
