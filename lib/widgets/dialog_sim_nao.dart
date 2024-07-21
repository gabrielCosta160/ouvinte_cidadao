import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/utils.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';

Future showMyDialogSimNao(
    {required BuildContext context,
    required String titulo,
    required String mensagem,
    double? maxWidth,
    required Function onClickBotaoSim}) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialog(
          titulo: titulo,
          mensagem: mensagem,
          maxWidth: maxWidth,
          onClickBotaoSim: onClickBotaoSim,
        );
      });
}

class MyDialog extends StatelessWidget {
  double? maxWidth;
  String titulo;
  String mensagem;
  Function? onClickBotaoSim;

  MyDialog(
      {required this.titulo,
      required this.mensagem,
      this.maxWidth = 350,
      this.onClickBotaoSim,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: isVisualizacaoMobile()
            ? (context.mediaQuery.size.width - 80)
            : (maxWidth ?? 350),
        height: 250,
        padding: const EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                  right: 5,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )),
              Positioned(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        titulo,
                        style: context.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      mensagem,
                      style: context.textTheme.bodyMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Center alignment
                      children: [
                        Expanded(
                          child: Botao(
                            titulo: 'Sim',
                            cor: Colors.red,
                            onClick: () {
                              Navigator.of(context).pop();
                              onClickBotaoSim!();
                            },
                          ),
                        ), // Add space between buttons
                        Expanded(
                          child: Botao(
                            titulo: 'Não',
                            cor: Colors.grey,
                            onClick: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
