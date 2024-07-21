import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/utils.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';

Future showMyBottomSheet({
  required BuildContext context,
  String? titulo,
  String? mensagem,
  String? tituloBotao,
  double? maxWidth,
  Function? onClick,
  Widget? corpo,
}) async {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return MyBottomSheet(
        titulo: titulo,
        mensagem: mensagem,
        tituloBotao: tituloBotao,
        maxWidth: maxWidth,
        onClick: onClick,
        corpo: corpo,
      );
    },
  );
}

class MyBottomSheet extends StatelessWidget {
  double? maxWidth;
  String? titulo;
  String? mensagem;
  String? tituloBotao;
  Function? onClick;
  Widget? corpo;

  MyBottomSheet({
    required this.titulo,
    required this.tituloBotao,
    required this.mensagem,
    this.maxWidth = 350,
    this.onClick,
    this.corpo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  titulo != null
                      ? Text(
                    titulo!,
                    style: context.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  )
                      : SizedBox(height: 0),
                  if (corpo != null) corpo!,
                  mensagem != null
                      ? Text(
                    mensagem!,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  )
                      : SizedBox(height: 0),
                  SizedBox(height: 20),
                  tituloBotao != null
                      ? Botao(
                    titulo: tituloBotao!,
                    onClick: () {
                      Navigator.of(context).pop();
                      if (onClick != null) {
                        onClick!();
                      }
                    },
                  )
                      : SizedBox(height: 0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
