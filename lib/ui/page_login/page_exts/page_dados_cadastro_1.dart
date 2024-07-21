import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/domain/usuario/services/services_usuario.dart';
import 'package:ouvinte_cidadao/infra/exceptions.dart';
import 'package:ouvinte_cidadao/infra/formatacao.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/infra/utils.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_login.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_exts/page_dados_cadastro_1.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_exts/page_email.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/campo_texto.dart';

extension PageDadosCadastro1 on PageLoginState {
  Widget pageDadosCadastro1(
  ) {
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
              CampoTexto(
                titulo: 'Nome',
                'Digite seu nome',
                controller.tecNome,
                onChanged: (value) {
                  exibirCampoSenha.value = true;
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CampoTexto(
                inputFormatters: [CpfInputFormatter()],
                titulo: 'CPF',
                'Digite seu CPF',
                controller.tecCPF,
                onChanged: (value) {
                  validarCPF(value);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CampoTexto(
                textInputType: TextInputType.phone,
                titulo: 'Telefone',
                'Digite seu telefone',
                controller.tecTelefone,
                onChanged: (s) async {
                  await controller.definirTelefone();
                },
              ),
              const SizedBox(
                height: 24,
              ),
              CampoTexto(
                titulo: 'Endereço',
                'Digite seu endereço',
                controller.tecEndereco,
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            children: [
              Botao(
                titulo: 'Próximo',
                onClick: () async {
                  try {
                    if (validarCPF( controller.tecCPF.text) == false) {
                      throw ECpfInvalido();
                    }
                    if ( controller.tecNome.text.isEmpty ||
                        controller.tecCPF.text.isEmpty ||
                        controller.tecEndereco.text.isEmpty) {
                      throw ECampoObrigatorio();
                    }
                    controller.irPara(PaginasLogin.paginaDados2);
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
                        controller
                            .irPara(PaginasLogin.paginaInformarEmailSenha);
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
