import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ouvinte_cidadao/infra/textos.dart';
import 'package:ouvinte_cidadao/ui/cadastro_solicitacoes/ctrl_cadastro_solicitacao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_remover_foto.dart';
import '../../infra/theme.dart';
import '../../widgets/botoes/botao_capturar_foto.dart';
import '../../widgets/botoes/botao_voltar.dart';
import '../../widgets/select_box.dart';

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

  String _locationMessage = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: corBackgroundLight,
        appBar: PreferredSize(
          preferredSize: Size(context.width, 50),
          child: Container(
            color: corBotao,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  novaSolicitacao,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        body: body(),
        bottomNavigationBar: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: BotaoBottomApp(
                padding: EdgeInsets.all(4),
                titulo: voltar,
                onClick: (context) {
                  Navigator.of(context).pop();
                },
                cor: Colors.grey,
              ),
            ),
            Expanded(flex: 2, child: botaoSalvar())
          ],
        ),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: campos(),
        ),
      ),
    );
  }

  List<Widget> campos() {
    return [
      Text(widget.titulo, style: context.textTheme.titleMedium),
      comboTipoProblema(),
      imagemSolicitacao(),
      botaoCapturaPosicao(),
      campoObservacao(),
    ];
  }

  Widget campoObservacao() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: corBotao,
                child: const Text(
                  '4',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                informacoes,
                style: TextStyle(color: corBotao, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        TextField(
          controller: controller.textController,
          decoration: const InputDecoration(
            constraints: BoxConstraints(maxHeight: 200),
            hintText: adicioneMaisInformacoes,
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: Colors.black),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.black), // Cor da borda quando habilitada
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black), // Cor da borda quando focada
            ),
            border: OutlineInputBorder(),
          ),
          maxLines: null,
        ),
      ],
    );
  }

  Widget botaoSalvar() {
    return BotaoBottomApp(
      titulo: enviar,
      onClick: (context) {},
      cor: Colors.green,
      padding: EdgeInsets.all(4),
    );
  }

  Widget imagemSolicitacao() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: corBotao,
                child: const Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                foto,
                style: TextStyle(color: corBotao, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        controller.imagem != null
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [SizedBox(height: 0,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    height: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        controller.imagem!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BotaoRemoverFoto(() {
                      controller.imagem = null;
                    }),
                  )
                ],
              )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: botaoSolicitacao(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 54, right: 54, top: 16),
                  child: Center(
                      child: Image.asset(
                          "assets/imagens/imagemCampoFoto.png")),
                ),
              ],
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BotaoLink(titulo: 'Selecionar na galeria', onClick: () {FilePicker.platform.pickFiles();}),
        )
      ],
    );
  }

  Widget botaoSolicitacao() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BotaoCapturarFoto(() {
          _pickImage();
        }),
        // Text('ou'),
        // AbsorbPointer(
        //   absorbing: false,
        //   child: InkWell(
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: Padding(
        //             padding: const EdgeInsets.only(top: 2, bottom: 6),
        //             child: Text(
        //               selecioneUmaImagemDaGaleria,
        //               textAlign: TextAlign.center,
        //               style: TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 color: corBotao,
        //               ),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //     onTap: () {},
        //   ),
        // ),
      ],
    );
  }

  Widget botaoCapturaPosicao() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: corBotao,
                child: const Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                localizacao,
                style: TextStyle(color: corBotao, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        BotaoBottomApp(
          onClick: (context) => _showBottomSheet(context),
          titulo: 'Definir localização',
          icone: Icons.map_rounded,
        ),
      ],
    );
  }

  Future _showBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: corBackgroundLight,
      builder: (ctx) => construirBottomSheet(
        context,
        localizacao,
        Container(
          child: BotaoBottomApp(
            onClick: (context) => obterLocalizacao(context),
            titulo: capturarLocalizacao,
            icone: Icons.pin_drop_outlined,
          ),
        ),
      ),
    );
  }

  Widget dragLine() {
    return InkWell(
      child: Container(
        height: 3.5,
        width: 30,
        decoration: BoxDecoration(
            color: context.theme.dividerColor,
            borderRadius: BorderRadiusDirectional.circular(5)),
      ),
    );
  }

  Widget construirBottomSheet(BuildContext context, String titulo, Widget body,
      {double fractionHeight = 0.8, double? width}) {
    return Container(
      height: context.height * fractionHeight,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Container(
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: context.theme.colorScheme.background,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          dragLine(),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            titulo,
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                body,
              ],
            ),
          ),
        ),
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

  Widget comboTipoProblema() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, top: 24),
          child: Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: corBotao,
                child: const Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                selecioneUmMotivo,
                style: TextStyle(color: corBotao, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SelectBox(
          listItens: widget.listaMotivos,
          selectedValue: controller.motivoSelecionado,
        ),
      ],
    );
  }

  Future abrirDialog(
      {required String mensagem,
      required String tituloBotao2,
      required Function onClick2}) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // O usuário deve apertar um botão para sair do diálogo
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Título do Diálogo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(mensagem),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(tituloBotao2),
              onPressed: () {
                onClick2();
              },
            ),
          ],
        );
      },
    );
  }

  Future obterLocalizacao(BuildContext context) async {
    bool statusPermissao;
    LocationPermission localizacao;

    statusPermissao = await Geolocator.isLocationServiceEnabled();
    if (!statusPermissao) {
      abrirDialog(
          mensagem: suaLocalizacaoEstaDesativada,
          onClick2: () {
            obterLocalizacao(context);
          },
          tituloBotao2: ativar);
    }

    localizacao = await Geolocator.checkPermission();
    if (localizacao == LocationPermission.denied) {
      localizacao = await Geolocator.requestPermission();
      if (localizacao == LocationPermission.denied) {
        abrirDialog(
            mensagem: suaLocalizacaoEstaDesativada,
            onClick2: () {
              obterLocalizacao(context);
            },
            tituloBotao2: ativar);
      }
    }

    if (localizacao == LocationPermission.deniedForever) {
      abrirDialog(
          mensagem: suaLocalizacaoEstaDesativada,
          onClick2: () {
            obterLocalizacao(context);
          },
          tituloBotao2: ativar);
    }

    Position position = await Geolocator.getCurrentPosition();
    controller.latitude = position.latitude;
    controller.longitude = position.longitude;
  }
}
