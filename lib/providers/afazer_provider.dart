import 'package:flutter/material.dart';
import 'package:projeto_flutter/entities/afazer_entity.dart';
import 'package:projeto_flutter/services/afazer_service.dart';

class AFazerProvider with ChangeNotifier {
  final service = AFazerService();
  List<AFazerEntity> _listaAfazeres = [];

  AFazerProvider() {
    buscarAfazeres();
  }

  buscarAfazeres() async {
   listaAfazeres = await service.buscar();
  }

  List<AFazerEntity> get listaAfazeres => _listaAfazeres;

   set listaAfazeres(List<AFazerEntity> val) {
    _listaAfazeres = val;
    notifyListeners();
  }
}
