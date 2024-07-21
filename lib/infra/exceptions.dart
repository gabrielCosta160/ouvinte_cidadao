import 'dart:js_interop';

import 'package:ouvinte_cidadao/infra/formatacao.dart';

class ECampoObrigatorio implements Exception {
  @override
  String toString() {
    return 'Preencha todos os campos';
  }
}

class ECpfInvalido implements Exception {
  @override
  String toString() {
    return 'Digite um CPF válido';
  }
}

class EFalhaNoCadastro implements Exception {
  String erro;

  EFalhaNoCadastro(this.erro);

  @override
  String toString() {
    return erro;
  }
}

class EFalhaNoLogin implements Exception {
  String erro;
  int statusCode;

  EFalhaNoLogin(this.erro, this.statusCode);

  @override
  String toString() {
    var mensagem = erro;
    if (statusCode == 404) {
      mensagem = 'E-mail ou senha incorreta';
    }
    return mensagem;
  }
}

class ESemInternet implements Exception {
  @override
  String toString() {
    return 'Verifique sua conexão com a internet';
  }
}

class EPreenchaTodosOsCampos implements Exception {
  String email;
  String senha;
  String nome;
  String cpf;
  String endereco;
  String telefone;

  EPreenchaTodosOsCampos(
      {required this.email,
        required this.senha,
        required this.nome,
        required this.telefone,
        required this.endereco,
        required this.cpf});

  @override
  String toString() {
    List<String> camposVazios = [];
    if (email.isEmpty) {
      camposVazios.add('E-mail');
    }
    if (senha.isEmpty) {
      camposVazios.add('Senha');
    }
    if (nome.isEmpty) {
      camposVazios.add('Nome');
    }
    if (telefone.isEmpty) {
      camposVazios.add('Telefone');
    }
    if (endereco.isEmpty) {
      camposVazios.add('Endereço');
    }
    if (cpf.isEmpty) {
      camposVazios.add('CPF');
    }

    String camposFormatados = camposVazios.formatarCampos();

    if (camposVazios.length > 1) {
      return 'Os campos ${camposFormatados.removerColchete()} são obrigatórios';
    }

    return 'O campo ${camposFormatados.removerColchete().removerVirgulas()} é obrigatório';
  }
}
class ECampoEmailOuSenhaVazio implements Exception {
  String email;
  String senha;

  ECampoEmailOuSenhaVazio({
    required this.email,
    required this.senha,
  });

  @override
  String toString() {
    List<String> camposVazios = [];
    if (email.isEmpty) {
      camposVazios.add('E-mail');
    }
    if (senha.isEmpty) {
      camposVazios.add('Senha');
    }

    String camposFormatados = camposVazios.join(' e ');

    if (camposVazios.length > 1) {
      return 'Os campos de ${camposFormatados.removerColchete().removerVirgulas()} são obrigatórios';
    }

    return 'O campo ${camposFormatados.removerColchete().removerVirgulas()} é obrigatório';
  }
}
