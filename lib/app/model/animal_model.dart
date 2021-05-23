class AnimalModel {
  AnimalModel({
    this.id,
    this.nome,
    this.peso,
    this.vacinas,
  });

  String? id;
  String? nome;
  double? peso;
  List<Vacina>? vacinas;

  factory AnimalModel.fromJson(Map<String, dynamic> json) => AnimalModel(
        id: json["id"],
        nome: json["nome"],
        peso: json["peso"].toDouble(),
        vacinas:
            List<Vacina>.from(json["vacinas"].map((x) => Vacina.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "peso": peso,
        "vacinas": List<dynamic>.from(vacinas!.map((x) => x.toJson())),
      };
}

class Vacina {
  Vacina({
    this.id,
    this.nome,
  });

  String? id;
  String? nome;

  factory Vacina.fromJson(Map<String, dynamic> json) => Vacina(
        id: json["id"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
      };
}
