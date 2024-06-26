import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_cadastro/page_login.dart';

import '../ui/cadastro_solicitacoes/page_cadastro_solicitacao.dart';
import '../ui/home/page_home.dart';
import '../ui/novas_solicitacoes/page_novas_solicitacoes.dart';
import '../ui/page_soliciatoes_efetuadas/page_solicitacoes_efetuadas.dart';

/// REFATORAR CÓDIGO COPIADO

class Rotas {
  static const splashPage = '/PageSplash';
  static const pageHome = '/PageHome';
  static const pageLogin = '/PageLogin';
  static const pageNovasSolicitacoes = '/PageSolicitacoes';
  static const pageSolicitacoesEfetuadas = '/PageSolicitacoesEfetuadas';
  static const pageCadastroSolicitacao = '/PageCadastroSolicitacao';

  static String inicial() {
    return splashPage;
  }


  static List<GetPage> obterPages(){
    return [
      GetPage(
        name: pageLogin,
        page: () =>  PageLogin(),
      ),
      GetPage(
        name: pageNovasSolicitacoes,
        page: () => const PageSolicitacoes(),
      ),
      GetPage(
        name: pageSolicitacoesEfetuadas,
        page: () => const PageSolicitacoesEfetuadas(),
      ),
    ];
  }
  static Future ir(BuildContext context, var page) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

}



class MyBindings extends Bindings {
  @override
  void dependencies() {}
}
