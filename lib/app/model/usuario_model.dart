import 'animal_model.dart';

class UsuarioModel {
  UsuarioModel({
    this.id,
    this.nome,
    this.email,
    this.senha,
    this.autorizacao,
    this.token,
    this.animais,
  });

  String? id;
  String? nome;
  String? email;
  String? senha;
  String? autorizacao;
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
