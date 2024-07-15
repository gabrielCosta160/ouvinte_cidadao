import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ouvinte_cidadao/domain/usuario/usuario.dart';
import 'package:ouvinte_cidadao/domain/usuario/usuario_repository.dart';
import 'package:ouvinte_cidadao/framework/dependencia.dart';
import 'package:ouvinte_cidadao/infra/exceptions.dart';

class ServUsuario {
  static Future<void> login(
      {required String email, required String senha}) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': senha,
      }),
    );

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      print('Response data: $responseData');
    } else {
      throw EFalhaNoLogin(response.body, response.statusCode);
    }
  }

  static Future<Usuario> cadastrar(
      {required nome,
      required endereco,
      required cpf,
      required String email,
      required String telefone,
      required String senha}) async {
    try {
      var repository = Get.put<IReposUsuario>(RepoApiUsuario());

      var usuario = Usuario(
          cpf: cpf,
          email: email,
          endereco: endereco,
          nome: nome,
          senha: senha,
          telefone: telefone);

      return repository.cadastrar(usuario);
    } on ESemInternet catch (e) {
      rethrow;
    } catch (e) {
      throw EFalhaNoCadastro(e.toString());
    }
  }
}
