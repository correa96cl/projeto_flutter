import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_flutter/components/app_bar_component.dart';
import 'package:projeto_flutter/components/body_component.dart';
import 'package:projeto_flutter/pages/detalhe/components/detalhe_header.dart';
import 'package:projeto_flutter/providers/afazer_provider.dart';
import 'package:projeto_flutter/services/picker_service.dart';
import 'package:provider/provider.dart';

class DetalhePage extends StatefulWidget {
  const DetalhePage({super.key});

  @override
  State<StatefulWidget> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  late AFazerProvider store;
  onEditImage() async {
    final pickerService = PickerService();
    final image = await pickerService.getImage(ImageSource.gallery);
    if (image != null) {
      final base64 = pickerService.base64(await image.readAsBytes()!);
      store.atualizarItemAfazer(0, base64);
    }
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<AFazerProvider>(context);
    return BodyComponent(
      child: Column(
        children: [
          DetalheHeaderWidget(
            onEdit: onEditImage,
            item: store.listaAfazeres.elementAt(0),
          ),
        ],
      ),
    );
  }
}
