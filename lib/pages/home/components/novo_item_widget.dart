import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/icon_button_component.dart';
import 'package:projeto_flutter/components/space_component.dart';
import 'package:projeto_flutter/entities/aFazerCheckList_entity.dart';
import 'package:projeto_flutter/entities/afazer_entity.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class NovoItemWidget extends StatefulWidget {
  final void Function(AFazerEntity item) callback;
  const NovoItemWidget({super.key, required this.callback});

  @override
  State<NovoItemWidget> createState() => _NovoItemWidgetState();
}

enum TipoLista {
  lembrete,
  tarefa,
}

class _NovoItemWidgetState extends State<NovoItemWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyTarefas = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  List<TextEditingController> items = [];

  TipoLista dropdownValue = TipoLista.lembrete;

  Widget defaultCheckItem(TextEditingController controller) {
    return CheckboxListTile(
      title: TextFormField(
        controller: controller,
        decoration:
            const InputDecoration(hintText: 'Digite um nome para a tarefa'),
        validator: (value) {
          return (value == null || value.isEmpty) ? 'Digite um nome' : null;
        },
      ),
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: const EdgeInsets.all(0),
      value: false,
      onChanged: null,
    );
  }

  void handleSubmit() {
    final isValido = _formKey.currentState!.validate();

    if (isValido) {
      print(Uuid().v4());
      //
      final item = AFazerEntity(
        uuid: const Uuid().v4(),
        titulo: _titleController.text,
        dataInicio: DateTime.now(),
        dataFim: DateTime.now(),
        conteudos: [],
      );

      bool valid = false;
      if (dropdownValue == TipoLista.tarefa) {
        final isTarefasValidas = _formKeyTarefas.currentState!.validate();

        if (isTarefasValidas) {
          valid = true;
          for (final value in items) {
            item.conteudos!.add(
                AFazerChecklistEntity(titulo: value.text, isChecked: true));
          }
        }
      } else {
        valid = true;
      }

      if (valid) {
        widget.callback(item);
        Navigator.pop(context);
      }
    }
  }

  void addItem() {
    if (dropdownValue == TipoLista.tarefa) {
      items.add(TextEditingController());

      setState(() {
        items = items;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Tipo de Lista',
                style: TextStyle(fontSize: 18),
              ),
              const SpacerComponent(
                isFull: true,
              ),
              DropdownButton(
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  value: TipoLista.lembrete,
                  items: const [
                    DropdownMenuItem(
                      value: TipoLista.lembrete,
                      child: Text('Lembrete'),
                    ),
                    DropdownMenuItem(
                      value: TipoLista.tarefa,
                      child: Text('Tarefas'),
                    ),
                  ])
            ],
          ),
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(hintText: 'Digite'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Digite um nome';
              }
              return null;
            },
          ),
          const SpacerComponent(),
          if (dropdownValue == TipoLista.tarefa)
            Row(
              children: [
                const Text('Lista:  '),
                const SpacerComponent(
                  isFull: true,
                ),
                IconButtonComponent(
                  onPressed: addItem,
                  size: 16,
                  icon: Icons.add,
                )
              ],
            ),
          if (dropdownValue == TipoLista.tarefa)
            Form(
              key: _formKeyTarefas,
              child: Column(
                children: items.map(defaultCheckItem).toList(),
              ),
            ),
          const SpacerComponent(),
          ElevatedButton(
            onPressed: handleSubmit,
            child: Text('Cadastrar'),
          )
        ],
      ),
    );
  }
}
