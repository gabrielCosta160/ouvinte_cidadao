import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/domain/usuario/services/services_usuario.dart';
import 'package:ouvinte_cidadao/domain/usuario/usuario.dart';
import 'package:ouvinte_cidadao/infra/exceptions.dart';
import 'package:ouvinte_cidadao/infra/formatacao.dart';
import 'package:ouvinte_cidadao/ui/novas_solicitacoes/page_novas_solicitacoes.dart';
import 'package:ouvinte_cidadao/widgets/dialog.dart';
import 'package:ouvinte_cidadao/widgets/dialog_carregamento.dart';

class CtrlPageLogin {
  TextEditingController tecNome = TextEditingController();
  TextEditingController tecCPF = TextEditingController();
  TextEditingController tecTelefone = TextEditingController();
  TextEditingController tecEndereco = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecSenha = TextEditingController();

  PageController pageController = PageController();
  late BuildContext context;

  void inicializar() {
    inicializarRotas();
  }

  void fecharTeclado() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> irPara(PaginasLogin pagina) async {
    fecharTeclado();

    var goTo = PaginasLogin.parse(pagina);
    pageController.animateToPage(goTo,
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
  }

  void inicializarRotas() {
    pageController = PageController(
      initialPage: PaginasLogin.parse(PaginasLogin.paginaInformarEmailSenha),
    );
  }

  Future definirTelefone() async {
    tecTelefone.text = tecTelefone.text.toNumeroTelefone();
  }

  Future<void> cadastrar() async {
    try {
      var usuario = await ServUsuario.cadastrar(
          nome: tecNome.text,
          endereco: tecEndereco.text,
          cpf: tecCPF.text,
          email: tecEmail.text,
          telefone: tecTelefone.text,
          senha: tecSenha.text);

      await irPara(PaginasLogin.paginaInformarEmailSenha);

      tecEmail.text = usuario.email;
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                child: Text('Entendi'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future entrar(BuildContext context) async {
    try {
      showMyDialogCarregamento(context: context);

      await Future.delayed(const Duration(seconds: 2));

      await ServUsuario.login(email: tecEmail.text, senha: tecSenha.text);

      Navigator.of(context).pop();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageSolicitacoes()),
      );
    } on EFalhaNoLogin catch (e) {
      Navigator.of(context).pop();
      showMyDialog(
          context: context,
          titulo: 'Erro ao fazer login',
          mensagem: e.toString(),
          tituloButton: 'Entendi');
    } catch(e){
      showMyDialog(
          context: context,
          titulo: 'Erro',
          mensagem: e.toString(),
          tituloButton: 'Entendi');
    }
  }
}

enum PaginasLogin {
  paginaInformarEmailSenha,
  paginaDados1,
  paginaDados2;

  static int parse(PaginasLogin valor) {
    switch (valor) {
      case PaginasLogin.paginaInformarEmailSenha:
        return 0;
      case PaginasLogin.paginaDados1:
        return 1;
      case PaginasLogin.paginaDados2:
        return 2;
      default:
        return 0;
    }
  }
}
