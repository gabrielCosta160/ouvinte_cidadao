import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/ctrl_cadastro_solicitacao.dart';
import 'package:ouvinte_cidadao/widgets/botao_check_campo_texto.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_secondario.dart';

class PageCadSolicitacao3 extends StatefulWidget {
  PageCadSolicitacao3({super.key});

  @override
  State<PageCadSolicitacao3> createState() => _PageCadSolicitacao3State();
}

class _PageCadSolicitacao3State extends State<PageCadSolicitacao3> {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tire uma foto',
              style: context.textTheme.displayMedium!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 160,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: context.width * 0.9),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    maxHeight: 250,
                  ),
                  decoration: BoxDecoration(
                      color: verde.withOpacity(0.2),
                      border: Border.all(color: verde, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: verde.withOpacity(0.2),
                        radius: 40,
                        child: IconButton(
                          iconSize: 50,
                          color: verde,
                          onPressed: () async {
                            await _pickImage();
                          },
                          icon: Icon(Icons.camera_alt),
                        ),
                      ),
                      Text(
                        'Clique para abrir a câmera',
                        style:
                            context.textTheme.bodyLarge!.copyWith(color: verde),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BotaoLink(
                      titulo: 'Selecionar na galeria',
                      onClick: () {
                        FilePicker.platform.pickFiles();
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    if (controller.imagem != null) {
      controller.imagem = null;
    }
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        controller.imagem = File(pickedFile.path);
      });
    }
  }
}
