import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/icon_button_component.dart';
import 'package:projeto_flutter/components/space_component.dart';


class PerfilTab extends StatelessWidget {
  const PerfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
            margin: const EdgeInsets.all(0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const CircleAvatar(child: Text('M')),
                  const SizedBox(width: 8),
                  const Text('Marcelo Andres Valderrama Correa',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SpacerComponent(
                    isFull: true,
                  ),
                  IconButtonComponent(
                    icon: Icons.more_vert,
                    onPressed: () {},
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Minhas Estatísticas',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: const [
            Icon(Icons.list),
            SizedBox(
              height: 8,
            ),
            Text('Total de Notas: '),
            Text('0'),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.checklist),
            SizedBox(
              height: 8,
            ),
            Text('Concluídas: '),
            Text('0'),
          ],
        ),
        const SizedBox(width: 16),
        const Divider(),
        const SizedBox(width: 16),
        const Text(
          'Configurações',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            const Text('Tema Escuro'),
            const Spacer(),
            Switch(value: true, onChanged: (val) {})
          ],
        )
      ]),
    );
  }
}
