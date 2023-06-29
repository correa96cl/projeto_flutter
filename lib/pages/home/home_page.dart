import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/body_component.dart';
import 'package:projeto_flutter/pages/home/abas/afazes_tab.dart';
import 'package:projeto_flutter/pages/home/abas/perfil_tab.dart';
import 'package:projeto_flutter/providers/afazer_provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  late AFazerProvider store;
  late int abaSeleccionada;

  void handleTab(int tabIdx) {
    setState(() {
      abaSeleccionada = tabIdx;
    });
  }

  @override
  void initState() {
    abaSeleccionada = 0;
    store = Provider.of<AFazerProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> abas = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Perfil'),
    ];

    final List<Widget> conteudos = [const AfazeresTab(), const PerfilTab()];

    return BodyComponent(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      bar: BottomNavigationBar(
        items: abas,
        currentIndex: abaSeleccionada,
        onTap: handleTab,
      ),
      actionButtom: FloatingActionButton(
        onPressed: () {
          store.abrirModalCadastro(context);
        },
        child: const Icon(Icons.add),
      ),
      child: conteudos.elementAt(abaSeleccionada),
    );
  }
}
