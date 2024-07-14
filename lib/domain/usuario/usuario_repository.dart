import 'dart:convert';

import 'package:ouvinte_cidadao/domain/usuario/usuario.dart';

import '../../infra/request_helper.dart';
import '';

import 'package:http/http.dart' as http;

abstract class IReposUsuario {
  Future<Usuario> cadastrar(Usuario usuario);
}

class RepoApiUsuario implements IReposUsuario {
  @override
  Future<Usuario> cadastrar(Usuario usuario) async {
    var response = await requisicaoPost(
        endPoint: 'http://127.0.0.1:8000/api/users', body: usuario.toMap());

    var retorno = jsonDecode(response.body);

    var usuarios = Usuario.fromJsonObject(retorno['user']);
    return usuarios;
  }
}
