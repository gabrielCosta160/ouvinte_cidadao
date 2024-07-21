import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/domain/usuario/services/services_usuario.dart';
import 'package:ouvinte_cidadao/infra/exceptions.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_login.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_exts/page_dados_cadastro_1.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_exts/page_email.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/campo_email_login.dart';
import 'package:ouvinte_cidadao/widgets/campo_senha_login.dart';
import 'package:ouvinte_cidadao/widgets/campo_texto.dart';

extension PageDadosCadastro2 on PageLoginState {
  Widget pageDadosCadastro2({
    required TextEditingController tecEmail,
    required TextEditingController tecSenha,
  }) {
    var obscureText = true;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Cadastro',
                style: context.textTheme.titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text('Preencha seus dados'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              CampoEmailLogin(tecEmail),
              const SizedBox(
                height: 24,
              ),
              CampoTexto(
                titulo:       'Senha',
                'Digite uma senha',
                tecSenha,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              Botao(
                titulo: 'Cadastrar',
                onClick: () async {
                  try {
                    if (tecEmail.text.isEmpty || tecSenha.text.isEmpty) {
                      throw ECampoObrigatorio();
                    }
                    await controller.cadastrar();
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
                },
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: BotaoLink(
                      textAlign: TextAlign.center,
                      titulo: 'Voltar',
                      onClick: () {
                        controller.irPara(PaginasLogin.paginaDados1);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
