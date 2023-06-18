import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/app_bar_component.dart';
import 'package:projeto_flutter/pages/home/abas/afazes_tab.dart';
import 'package:projeto_flutter/pages/home/abas/perfil_tab.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  late int abaSeleccionada;

  void handleTab(int tabIdx) {
    setState(() {
      abaSeleccionada = tabIdx;
    });
  }

  @override
  void initState() {
    abaSeleccionada = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _abas = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle), label: 'Perfil'),
    ];

    final List<Widget> _conteudos = [
      AfazeresTab(
        valorInicial: 0,
        callback: handleTab,
      ),
      const PerfilTab()
    ];

    return Scaffold(
      appBar: const AppBarComponent(),
      body: _conteudos.elementAt(abaSeleccionada),
      bottomNavigationBar: BottomNavigationBar(
        onTap: handleTab,
        currentIndex: abaSeleccionada,
        items: _abas,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          handleTab(1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
