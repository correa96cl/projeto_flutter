import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/icon_button_component.dart';
import 'package:projeto_flutter/components/space_component.dart';
import 'package:projeto_flutter/entities/afazer_entity.dart';

class DetalheMenuWidget extends StatelessWidget {
  final AFazerEntity item;
  final Function() onDone;
  final Function() onDelete;

  const DetalheMenuWidget({
    super.key,
    required this.item,
    required this.onDone,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      if (item.conteudos.isNotEmpty)
      const Text('Tarefas', style: TextStyle(fontSize: 24)),
      SpacerComponent(isFull: true,),
      IconButtonComponent(
        size: 18, color: (item.isConcluido == true) ? Colors.green: Colors.grey[600],
        icon: (item.isConcluido == true) ? Icons.done_all : Icons.done,
        onPressed: onDone,
      ),
      IconButtonComponent(
          size: 18,
          color: Colors.red,
          icon: Icons.delete_forever,
          onPressed: onDelete,
        )
    ],);
  }
}
