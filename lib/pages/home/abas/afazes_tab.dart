import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/space_component.dart';
import 'package:projeto_flutter/pages/home/components/item_widget.dart';
import 'package:projeto_flutter/pages/home/components/novo_item_widget.dart';
import 'package:projeto_flutter/providers/afazer_provider.dart';
import 'package:provider/provider.dart';

class AfazeresTab extends StatefulWidget {
  const AfazeresTab({super.key});

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
late AFazerProvider store;  

  void handleAdicionar() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children: [
            NovoItemWidget(
              callback: (item) {
               store.listaAfazeres = [...store.listaAfazeres, item];
              },
            ),
          ],
        );
      },
    );
  }

  void handleExcluir(int index) {

  }

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    store = Provider.of<AFazerProvider>(context);

    return Column(
      children: [
        ElevatedButton(
            onPressed: handleAdicionar, child: const Text('Adicionar')),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: ListView.builder(
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
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: ItemWidget(
                        item: item,
                        onPressed: () {},
                      ))); //Text(item.titulo));
            },
          ),
        ),
        const SpacerComponent(),
      ],
    );
  }
}
