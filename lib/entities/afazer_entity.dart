import 'package:projeto_flutter/entities/aFazerCheckList_entity.dart';

class AFazerEntity {
  String uuid;
  String titulo;
  DateTime dataInicio;
  DateTime dataFim;
  bool? isConcluido;
  List<AFazerChecklistEntity>? conteudos;
  String? image;

  AFazerEntity(
      {required this.uuid,
      required this.titulo,
      required this.dataInicio,
      required this.dataFim,
      this.isConcluido = false,
      this.conteudos = const [],
      this.image});

  factory AFazerEntity.fromJson(Map<String, dynamic> json) {
    return AFazerEntity(
      uuid: json['uuid'],
      titulo: json['titulo'],
      dataInicio: DateTime.fromMicrosecondsSinceEpoch(json['dataInicio']),
      dataFim: DateTime.fromMicrosecondsSinceEpoch(json['dataFim']),
      isConcluido: json['isConcluido'],
      conteudos: json['conteudos'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'titulo': titulo,
      'dataInicio': dataInicio.microsecondsSinceEpoch,
      'dataFim': dataFim.microsecondsSinceEpoch,
      'isConcluido': isConcluido,
      'conteudos': conteudos,
      if (image != null) 'image': image,
    };
  }

  static List<AFazerEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((item) => AFazerEntity.fromJson(item)).toList() ?? [];
  }
}
