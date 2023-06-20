import 'package:projeto_flutter/entities/aFazerCheckList_entity.dart';

class AFazerEntity {
  String uuid;
  String titulo;
  DateTime dataInicio;
  DateTime dataFim;
  bool? isConcluido;
  List<AFazerChecklistEntity>? conteudos;
  String? image;

  AFazerEntity({required this.uuid, required this.titulo, required this.dataInicio, required this.dataFim, 
  this.isConcluido,  this.conteudos,  this.image});


}