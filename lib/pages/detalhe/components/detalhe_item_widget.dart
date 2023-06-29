import 'package:flutter/material.dart';
import 'package:projeto_flutter/entities/aFazerCheckList_entity.dart';

class DetalheItemWidget extends StatelessWidget {
  final AFazerChecklistEntity item;
  final Function(bool? val) onChanged;

  const DetalheItemWidget({
    super.key,
    required this.item,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          value: item.isChecked,
          onChanged: onChanged,
          title: Text(item.titulo),
          contentPadding: const EdgeInsets.all(0),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        const Divider(),
      ],
    );
  }
}
