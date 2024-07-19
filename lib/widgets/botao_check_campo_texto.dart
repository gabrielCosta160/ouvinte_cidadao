import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/widgets/botao_check_box.dart';
import 'package:ouvinte_cidadao/widgets/campo_texto.dart';

class BotaoCheckboxCampoTexto extends StatefulWidget {
  bool selecionado;
  bool exibirCampoObservacao;
  bool isCampoObrigatorio;
  String titulo;
  String? hint;
  var exibir = false.obs;
  Function() onClick;
  Function(String) onChanged;
  TextEditingController tecCampoTexto;

  BotaoCheckboxCampoTexto({
    required this.titulo,
    required this.onClick,
    required this.onChanged,
    required this.tecCampoTexto,
    required this.selecionado,
    required this.isCampoObrigatorio,
    required this.exibirCampoObservacao,
    this.hint,
    super.key,
  });

  @override
  State<BotaoCheckboxCampoTexto> createState() =>
      BotaoCheckboxCampoTextoState();
}

class BotaoCheckboxCampoTextoState extends State<BotaoCheckboxCampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BotaoCheckbox(
          onClick: () {
            widget.onClick();
          },
          selecionado: widget.selecionado,
          titulo: widget.titulo,
        ),
        widget.selecionado && widget.exibirCampoObservacao
            ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: CampoTexto(
                widget.hint ?? 'Escreva aqui...',
                widget.tecCampoTexto,
                maxLines: 6,
                onChanged: (novaDesc) {
                  widget.onChanged(novaDesc);
                },
              ),
            )
            : SizedBox(
                height: 0,
              ),
      ],
    );
  }
}
