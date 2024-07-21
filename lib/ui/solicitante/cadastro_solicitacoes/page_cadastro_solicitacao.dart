import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ouvinte_cidadao/infra/textos.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/ctrl_cadastro_solicitacao.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/page_etxs/page_view_1.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/page_etxs/page_view_2.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/page_etxs/page_view_3.dart';
import 'package:ouvinte_cidadao/widgets/botao_check_box.dart';
import 'package:ouvinte_cidadao/widgets/botao_check_campo_texto.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_capturar_foto.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_remover_foto.dart';
import 'package:ouvinte_cidadao/widgets/select_box.dart';

class PageCadastroSoliticacao extends StatefulWidget {
  String titulo;
  List<String> listaMotivos;

  PageCadastroSoliticacao(this.listaMotivos, this.titulo, {Key? key})
      : super(key: key);

  @override
  State<PageCadastroSoliticacao> createState() =>
      PageCadastroSoliticacaoState();
}

class PageCadastroSoliticacaoState extends State<PageCadastroSoliticacao> {
  CtrlCadastroSolicitacao controller = CtrlCadastroSolicitacao();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(context.width, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ controller.listaPages.length > 1
                  ? Obx(() => controller.pageViewControllerLoaded.value
                  ? _addProgressBar()
                  : SizedBox.shrink())
                  : SizedBox.shrink(),],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Botao(
                          titulo: 'Próximo',
                          onClick: () {
                            controller.irPara();
                          }),
                      BotaoLink(
                          textAlign: TextAlign.center,
                          titulo: 'Voltar',
                          onClick: () {
                            controller.voltarParaPageAnterior(context);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: PageView(
            controller: controller.pageViewController,
            children: [
              PageCadSolicitacao1(listaMotivos: widget.listaMotivos),
              PageCadSolicitacao2(),
              PageCadSolicitacao3()
            ],
          )),
    );
  }

  Widget _addProgressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Obx(() {
                        return LinearProgressIndicator(
                          backgroundColor: context.theme.colorScheme.background,
                          value: (controller.paginaAtual.value /
                              controller.listaPages.length) +
                              1 / controller.listaPages.length,
                          minHeight: 10,
                          borderRadius: BorderRadius.circular(20),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.theme.colorScheme.primary,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
