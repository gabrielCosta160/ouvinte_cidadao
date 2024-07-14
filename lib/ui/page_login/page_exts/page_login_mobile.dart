import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_registrar.dart';
import 'package:ouvinte_cidadao/widgets/bottomSheet.dart';
import 'package:ouvinte_cidadao/widgets/campo_email_login.dart';
import 'package:ouvinte_cidadao/widgets/campo_senha_login.dart';

class PageLoginMobile extends StatefulWidget {
  const PageLoginMobile({super.key});

  @override
  State<PageLoginMobile> createState() => _PageLoginMobileState();
}

class _PageLoginMobileState extends State<PageLoginMobile> {
  late CtrlPageLogin controller;

  @override
  void initState() {
    controller = CtrlPageLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: context.height,
          width: context.width,
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: [verde, roxo])),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Bem vindo!',
                      style: context.textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.bold, color: branco),
                    ),
                    Text(
                      'Faça login para continuar',
                      style: TextStyle(color: branco),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Botao(
                      titulo: 'Entrar',
                      onClick: (x) async {
                        await showMyBottomSheet(
                          context: context,
                          corpo: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: CampoEmailLogin(controller.tecEmail),
                              ),
                              CampoSenhaLogin(controller.tecSenha),
                              SizedBox(
                                height: 24,
                              ),
                              Botao(titulo: 'Entrar', onClick: (e) {}),
                              BotaoLink(
                                textAlign: TextAlign.center,
                                  titulo: 'Voltar',
                                  onClick: () {
                                    Navigator.of(context).pop;
                                  })
                            ],
                          ),
                          maxWidth: context.width,
                        );
                      },
                    ),
                    BotaoRegistrar(
                      titulo: 'Registrar',
                      onClick: (s) {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
