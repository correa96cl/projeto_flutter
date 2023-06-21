class AFazerChecklistEntity {
  String titulo;
  bool isChecked;

  AFazerChecklistEntity({required this.titulo, required this.isChecked});

  Map<String, dynamic> toJson() {
    return {
      'isChecked': isChecked,
      'titulo': titulo,
    };
  }

  factory AFazerChecklistEntity.fromJson(Map<String, dynamic> json) {
    return AFazerChecklistEntity(
      titulo: json['titulo'],
      isChecked: json['isChecked'],
    );
  }

  static List<AFazerChecklistEntity> fromJsonList(List<dynamic>? json) {
    return json?.map((e) => AFazerChecklistEntity.fromJson(e)).toList() ?? [];
  }
}
