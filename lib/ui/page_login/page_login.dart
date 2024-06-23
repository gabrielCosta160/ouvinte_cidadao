import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/ui/novas_solicitacoes/page_novas_solicitacoes.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_voltar.dart';
import 'package:ouvinte_cidadao/widgets/campo_texto.dart';

class PageLogin extends StatefulWidget {
  PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => PageLoginState();
}

class PageLoginState extends State<PageLogin> {
  CtrlPageLogin controller = CtrlPageLogin();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: corBackgroundLight,
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white,
                  width: context.width,
                  child: Image.asset('assets/imagens/logo.png')),
              Column(
                children: [
                  CampoTexto('E-mail', 'Digite seu email', controller.tecEmail),
                  SizedBox(
                    height: 32,
                  ),
                  CampoTexto('Senha', 'Digite uma senha', controller.tecSenha),
                ],
              ),
              BotaoBottomApp(titulo: "Entrar", onClick: (context)  {  Rotas.ir(
              context, PageSolicitacoes() );
              })
            ],
          ),
        ),
      ),
    ));
  }
}
