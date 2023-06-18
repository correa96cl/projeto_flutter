import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/space_component.dart';
import 'package:projeto_flutter/entities/afazer_entity.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({super.key});

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late List<AFazerEntity> _listaAfazeres;

  void handleAdicionar() {
    final item = AFazerEntity(
        uuid: 'teste 03',
        titulo: 'titulo 03',
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        isConcluido: false);

    _listaAfazeres.add(item);

    setState(() {
      _listaAfazeres = _listaAfazeres;
    });
  }

  void handleExcluir(int index) {
    _listaAfazeres.removeAt(index);
    setState(() {
      _listaAfazeres = _listaAfazeres;
    });
  }

  @override
  void initState() {
    _listaAfazeres = [
      AFazerEntity(
          uuid: 'teste 01',
          titulo: 'titulo 01',
          dataInicio: DateTime.now(),
          dataFim: DateTime.now(),
          isConcluido: false),
      AFazerEntity(
          uuid: 'teste 02',
          titulo: 'titulo 02',
          dataInicio: DateTime.now(),
          dataFim: DateTime.now(),
          isConcluido: true),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: handleAdicionar, child: const Text('Adicionar')),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: ListView.builder(
            itemCount: _listaAfazeres.length,
            itemBuilder: (context, index) {
              final item = _listaAfazeres.elementAt(index);
              return Dismissible(
                  key: Key(item.uuid),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      handleExcluir(index);
                    }
                  },
                  child: Text(item.titulo));
            },
          ),
        ),
        const SpacerComponent(),
      ],
    );
  }
}
