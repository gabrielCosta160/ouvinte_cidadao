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
