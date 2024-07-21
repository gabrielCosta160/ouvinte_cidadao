import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/domain/usuario/services/services_usuario.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/infra/utils.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_exts/page_dados_cadastro_1.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_exts/page_dados_cadastro_2.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_exts/page_email.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_exts/mobile/page_login_mobile.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/campo_texto.dart';
import 'package:provider/provider.dart';

class PageLogin extends StatefulWidget {
  PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => PageLoginState();
}

class PageLoginState extends State<PageLogin> {
  late CtrlPageLogin controller;
  var exibirCampoSenha = false.obs;

  @override
  void initState() {
    controller = CtrlPageLogin();
    controller.inicializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (p0, p1) {
      return isVisualizacaoMobile()
          ? PageLoginMobile()
          : SafeArea(
              child: Scaffold(
                body: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 400),
                          color: corBackgroundLight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PageView(
                              controller: controller.pageController,
                              children: [
                                pageEmailSenha(
                                    tecEmail: controller.tecEmail,
                                    tecSenha: controller.tecSenha),
                                pageDadosCadastro1(),
                                pageDadosCadastro2(
                                    tecEmail: controller.tecEmail,
                                    tecSenha: controller.tecSenha)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [verde, roxo],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
