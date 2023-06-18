import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/space_component.dart';

class AfazeresTab extends StatefulWidget {
  final int valorInicial;
  final void Function(int tabIndx)? callback;
  const AfazeresTab({super.key, required this.valorInicial, this.callback});

  @override
  State createState() => _AfazeresTab();
}

class _AfazeresTab extends State<AfazeresTab> {
  late int acumulador = 1;

  void sumarMaisUm() {
    setState(() {
      acumulador++;
    });
  }

  void handleCallback() {
    if (widget.callback != null) {
      widget.callback!(1);
    }
  }

  @override
  void initState() {
    acumulador = 1;

    super.initState();
  }

  buscarDados() async {
    //await service.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$acumulador'),
        const SpacerComponent(),
        ElevatedButton(onPressed: sumarMaisUm, child: const Text('+1')),
        const SpacerComponent(),
        ElevatedButton(onPressed: handleCallback, child: const Text('callback'))
      ],
    );
  }
}
