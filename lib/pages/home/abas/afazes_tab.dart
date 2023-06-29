import 'package:flutter/material.dart';
import 'package:projeto_flutter/app_routes.dart';
import 'package:projeto_flutter/entities/afazer_entity.dart';
import 'package:projeto_flutter/pages/home/components/item_widget.dart';
import 'package:projeto_flutter/providers/afazer_provider.dart';
import 'package:provider/provider.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({super.key});

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late AFazerProvider store;

  void handleExcluir(int index) {
    store.removerItemAfazer(index);
  }

  void onDetalhes(AFazerEntity item, int index) {
    store.selecionado = item;
    Navigator.pushNamed(context, AppRoutes.detalhe);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AFazerProvider>(context);

    return ListView.builder(
      itemCount: store.listaAfazeres.length,
      itemBuilder: (context, index) {
        final item = store.listaAfazeres.elementAt(index);
        return Dismissible(
            key: Key(item.uuid),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                handleExcluir(index);
              }
            },
            child: ItemWidget(
                item: item,
                onPressed: () {
                  onDetalhes(item, index);
                })); //Text(item.titulo));
      },
    );
  }
}
