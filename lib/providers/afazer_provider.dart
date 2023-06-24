import 'package:flutter/material.dart';
import 'package:projeto_flutter/entities/afazer_entity.dart';
import 'package:projeto_flutter/services/afazer_service.dart';

import '../pages/home/components/novo_item_widget.dart';

class AFazerProvider with ChangeNotifier {
  final service = AFazerService();
  List<AFazerEntity> _listaAfazeres = [];

  AFazerProvider() {
    buscarAfazeres();
  }

  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }

  void atualizarItemAfazer(int idx, String image){
    listaAfazeres.elementAt(idx).image = image;
    notifyListeners();
  }

  List<AFazerEntity> get listaAfazeres => _listaAfazeres;

  set listaAfazeres(List<AFazerEntity> val) {
    _listaAfazeres = val;
    notifyListeners();
  }

void removeItemAFazer(int index){
  listaAfazeres.removeAt(index);
  service.salvar(listaAfazeres);
  notifyListeners();
}

  void abrirModalCadastro(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children: [
            NovoItemWidget(
              callback: (item) {
                listaAfazeres = [item, ...listaAfazeres];
              },
            ),
          ],
        );
      },
    );
  }
}
