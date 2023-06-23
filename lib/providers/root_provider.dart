import 'package:projeto_flutter/providers/afazer_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class RootProvider {
  static List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider(create: (_) => AFazerProvider()),
    ];
  }
}
