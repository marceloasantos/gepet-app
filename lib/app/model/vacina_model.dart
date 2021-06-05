class VacinaModel {
  VacinaModel({
    this.id,
    this.nome,
  });

  String? id;
  String? nome;

  factory VacinaModel.fromJson(Map<String, dynamic> json) => VacinaModel(
        id: json["id"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
      };
}
