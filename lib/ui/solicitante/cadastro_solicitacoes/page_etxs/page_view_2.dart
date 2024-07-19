import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/ctrl_cadastro_solicitacao.dart';
import 'package:ouvinte_cidadao/widgets/botao_check_campo_texto.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_secondario.dart';

class PageCadSolicitacao2 extends StatefulWidget {
  PageCadSolicitacao2({super.key});

  @override
  State<PageCadSolicitacao2> createState() => _PageCadSolicitacao2State();
}

class _PageCadSolicitacao2State extends State<PageCadSolicitacao2> {
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
              'Onde está o problema?',
              style: context.textTheme.displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            width: context.width * 0.9,
            child: Column(
              children: [
                Container(
                  height: 400,
                  width: context.width * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [verde, roxo])),
                  child: Center(child: Text('Definir local no mapa')),
                ),
                BotaoSecondario(titulo: 'Capturar localização', onClick: (context) {},),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
