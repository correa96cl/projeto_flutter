import 'package:flutter/material.dart';
import 'package:projeto_flutter/entities/afazer_entity.dart';
import 'package:projeto_flutter/pages/home/components/novo_item_widget.dart';
import 'package:projeto_flutter/services/afazer_service.dart';


class AFazerProvider with ChangeNotifier {
  final service = AFazerService();
  List<AFazerEntity> _listaAfazeres = [];
  AFazerEntity? _selecionado;
  int? _idx;

  AFazerProvider() {
    buscarAfazeres();
  }

  buscarAfazeres() async {
    listaAfazeres = await service.buscar();
  }

  List<AFazerEntity> get listaAfazeres => _listaAfazeres;

  AFazerEntity? get selecionado {
    return _selecionado;
  }

  set selecionado(AFazerEntity? val) {
    _selecionado = val;
    notifyListeners();
  }

  set idx(int val) {
    _idx = val;
    notifyListeners();
  }

  void atualizarItemAfazer(int idx) {
    if (selecionado != null) {
      _listaAfazeres[idx] = _selecionado!;
      notifyListeners();
    }
  }

  set listaAfazeres(List<AFazerEntity> val) {
    _listaAfazeres = val;
    service.salvar(_listaAfazeres);
    notifyListeners();
  }

  void removerItemAfazer(int index) {
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
            NovoItemWidget(callback: (item) {
              listaAfazeres = [item, ...listaAfazeres];
            }),
          ],
        );
      },
    );
  }
}
