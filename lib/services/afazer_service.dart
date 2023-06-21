import 'dart:convert';

import 'package:projeto_flutter/entities/afazer_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AFazerService {
  final _key = 'KEY_AFAZER';

  Future<void> salvar(List<AFazerEntity> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(item);
    await prefs.setString(_key, listJson);
  }

  Future<List<AFazerEntity>> buscar() async {
    return [];
  }
}
