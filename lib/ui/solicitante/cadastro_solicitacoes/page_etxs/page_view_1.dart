import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/ctrl_cadastro_solicitacao.dart';
import 'package:ouvinte_cidadao/widgets/botao_check_campo_texto.dart';

class PageCadSolicitacao1 extends StatefulWidget {
  List<String> listaMotivos;

  PageCadSolicitacao1({required this.listaMotivos, super.key});

  @override
  State<PageCadSolicitacao1> createState() => _PageCadSolicitacao1State();
}

class _PageCadSolicitacao1State extends State<PageCadSolicitacao1> {
  late CtrlCadastroSolicitacao controller;

  @override
  void initState() {
    controller = CtrlCadastroSolicitacao();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Qual motivo da solicitação?',
              style: context.textTheme.displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Column(
            children: [
              widget.listaMotivos.isNotEmpty
                  ? Wrap(
                      children:
                          List.generate(widget.listaMotivos.length, (index) {
                        return Obx(() {
                          return BotaoCheckboxCampoTexto(
                              tecCampoTexto: controller.tecOutro,
                              exibirCampoObservacao:
                                  widget.listaMotivos[index] == 'Outro',
                              isCampoObrigatorio: true,
                              onChanged: (context) {},
                              titulo: widget.listaMotivos[index],
                              onClick: () {
                                if (controller.selecionadoIndex.value == index) {
                                  controller.selecionadoIndex.value = null;
                                } else {
                                  controller.selecionadoIndex.value = index;
                                }
                              },
                              selecionado: controller.selecionadoIndex.value == index);
                        });
                      }),
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
