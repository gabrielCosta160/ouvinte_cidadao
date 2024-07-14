import 'dart:convert';

import 'package:ouvinte_cidadao/infra/exts_json.dart';

class Usuario {
  int? id;
  String email;
  String nome;
  String? senha;
  String cpf;
  String telefone;
  String endereco;

  Usuario(
      {this.id,
      required this.email,
      required this.cpf,
      required this.telefone,
      required this.nome,
      required this.endereco,
      required this.senha});

  Usuario.fromJsonObject(Map<String, dynamic> jsonBody)
      : id = jsonBody.asIntNull('userID') ?? 0,
        email = jsonBody.asString('email'),
        nome = jsonBody.asString('nome'),
        telefone = jsonBody.asString('telefone'),
        cpf = jsonBody.asString('cpf'),
        endereco = jsonBody.asString('endereco');

  Map<String, dynamic> toMap() => {
        "nome": nome,
        "email": email,
        "password": senha,
        "telefone": telefone,
        "cpf": cpf,
        "endereco": endereco
      };
}
