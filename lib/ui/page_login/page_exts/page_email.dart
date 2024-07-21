import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_login.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/campo_email_login.dart';
import 'package:ouvinte_cidadao/widgets/campo_senha_login.dart';
import 'package:ouvinte_cidadao/widgets/campo_texto.dart';
import 'package:ouvinte_cidadao/widgets/dialog_carregamento.dart';

extension PageEmail on PageLoginState {
  Widget pageEmailSenha({
    required TextEditingController tecEmail,
    required TextEditingController tecSenha,
  }) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Bem vindo!',
                  style: context.textTheme.displaySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text('Faça login para continuar'),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                CampoEmailLogin(
                  tecEmail,
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    CampoSenha(
                      tecSenha,
                      exibirEsqueciSenha: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Botao(
                  titulo: 'Entrar',
                  onClick: () async {
                    await controller.entrar(context);
                  },
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                BotaoLink(
                    textAlign: TextAlign.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    titulo: 'Não tenho conta',
                    onClick: () {
                      controller.irPara(PaginasLogin.paginaDados1);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
