import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {                   

    final List<BottomNavigationBarItem> _abas = [
       const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Perfil')

    ];


    final List<Widget> _conteudos = [
      const Text('home'),
      const Text('perfil'),
      const Text('Produto')
    ];

    return Scaffold(
      appBar: AppBar(title: Text('School Flutter MJV')),
      body: _conteudos.elementAt(1),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: _abas,
      ),
    );
  }
}
