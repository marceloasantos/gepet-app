import 'animal_model.dart';

class UsuarioModel {
  UsuarioModel({
    this.id,
    this.nome,
    this.email,
    this.senha,
    this.autorizacao,
    this.autorizacoes,
    this.token,
    this.animais,
  });

  String? id;
  String? nome;
  String? email;
  String? senha;
  String? autorizacao;
  List<Autorizacoes>? autorizacoes;
  String? token;
  List<AnimalModel>? animais;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        nome: json["nome"],
        email: json["email"],
        senha: json["senha"],
        autorizacao: json["autorizacao"],
        token: json["token"],
        animais: null != json["animais"]
            ? List<AnimalModel>.from(
                json["animais"].map(
                  (x) => AnimalModel.fromJson(x),
                ),
              )
            : [],
        autorizacoes: null != json["autorizacoes"]
            ? List<Autorizacoes>.from(
                json["autorizacoes"].map((x) => Autorizacoes.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "email": email,
        "senha": senha,
        "autorizacao": autorizacao,
        "token": token,
      };
}

class Autorizacoes {
  Autorizacoes({
    this.id,
    this.nome,
  });

  String? id;
  String? nome;

  factory Autorizacoes.fromJson(Map<String, dynamic> json) => Autorizacoes(
        id: json["id"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
      };
}
