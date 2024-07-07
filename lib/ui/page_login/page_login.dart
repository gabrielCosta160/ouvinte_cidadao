import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/domain/login/services_login.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/services/auth_services.dart';
import 'package:ouvinte_cidadao/ui/novas_solicitacoes/page_novas_solicitacoes.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/ui/page_login/pege_exts/page_email.dart';
import 'package:ouvinte_cidadao/ui/page_login/pege_exts/page_senha.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_voltar.dart';
import 'package:ouvinte_cidadao/widgets/campo_texto.dart';
import 'package:provider/provider.dart';

class PageLogin extends StatefulWidget {
  PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => PageLoginState();
}

class PageLoginState extends State<PageLogin> {
  CtrlPageLogin controller = CtrlPageLogin();
  var exibirCampoSenha = false.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: corBackgroundLight,
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            ///AQUI VAI IMAGEM DE BACKGROUND DO LOGIN
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 400),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          pageEmailSenha(
                              tecEmail: controller.tecEmail,
                              tecSenha: controller.tecSenha),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget pageEmailSenha({
    required TextEditingController tecEmail,
    required TextEditingController tecSenha,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Bem vindo!',
                style: context.textTheme.displaySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text('Faça login para continuar'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CampoTexto(
            'Email',
            'Digite seu email',
            tecEmail,
            onChanged: (value) {
              exibirCampoSenha.value = true;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Obx(
            () {
              return exibirCampoSenha.value
                  ? AnimatedOpacity(
                      opacity: exibirCampoSenha.value ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 300),
                      child: CampoTexto(
                        'Senha',
                        'Digite sua senha',
                        tecSenha,
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    );
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BotaoBottomApp(
                titulo: 'Entrar',
                onClick: (context) async {
                  try {
                    await ServLogin.login(email:controller.tecEmail.text, senha: controller.tecSenha.text);


                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageSolicitacoes()),
                    );
                  } catch (e) {
                    // Se houver algum erro durante o login
                    print('Erro durante o login: $e');
                    // Tratar o erro de acordo com sua lógica
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Erro'),
                          content: Text(
                              'Falha ao fazer login. Verifique suas credenciais.'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('OK'),
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
              BotaoLink(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  titulo: 'Não tenho conta',
                  onClick: (context) {}),
            ],
          ),
        ],
      ),
    );
  }
}
