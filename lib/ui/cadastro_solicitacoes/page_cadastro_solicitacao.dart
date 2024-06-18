import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ouvinte_cidadao/widgets/botao_home.dart';

import '../../infra/theme.dart';
import '../../widgets/botao_capturar_foto.dart';
import '../../widgets/botao_voltar.dart';
import '../../widgets/select_box.dart';

class PageCadastroSoliticacao extends StatefulWidget {
  String titulo;

  PageCadastroSoliticacao(this.titulo, {Key? key}) : super(key: key);

  @override
  State<PageCadastroSoliticacao> createState() =>
      PageCadastroSoliticacaoState();
}

class PageCadastroSoliticacaoState extends State<PageCadastroSoliticacao> {
  // Controlador para o campo de texto
  final TextEditingController _textController = TextEditingController();
  String _locationMessage = "";
  File? imagem;
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: corBackgroundLight,
        appBar: PreferredSize(
          preferredSize: Size(context.width, 50),
          child: Container(
            color: corBotao,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nova solicitação',
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
                titulo: "Voltar",
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
                child: Text(
                  '4',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Informações',
                style: TextStyle(color: corBotao, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            constraints: BoxConstraints(maxHeight: 200),
            hintText: 'Adicione mais informações',
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
      titulo: 'Enviar',
      onClick: (context) {},
      cor: Colors.green,
      padding: EdgeInsets.all(4),
    );
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Testa se o serviço de localização está habilitado.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Serviço de localização desabilitado.";
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = "Permissão de localização negada.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = "Permissão de localização permanentemente negada.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _locationMessage =
          "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
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
                child: Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Foto',
                style: TextStyle(color: corBotao, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        imagem != null
            ? Container(
                height: 250,
                child: Image.file(
                  imagem!,
                  fit: BoxFit.cover,
                ),
              )
            : Container(
                height: 250,
                decoration: BoxDecoration(
                    color: corBotao.withOpacity(0.2),
                    border: Border.all(color: corBotao, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(child: botaoSolicitacao())),
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
        Text('ou'),
        AbsorbPointer(
          absorbing: false,
          child: InkWell(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 6),
                    child: Text(
                      'Selecione uma imagem da galeria',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: corBotao,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onTap: () {},
          ),
        ),
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
                child: Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Localização',
                style: TextStyle(color: corBotao, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        BotaoBottomApp(
          onClick: (context) => _showBottomSheet(context),
          titulo: 'Definir posição no mapa',
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
        'Localização',
        Container(
          child: BotaoBottomApp(
            onClick: (context) => _getCurrentLocation(),
            titulo: 'Capturar localização',
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
                          SizedBox(
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
    if (imagem != null) {
      imagem = null;
    }
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        imagem = File(pickedFile.path);
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
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Selecione um motivo',
                style: TextStyle(color: corBotao, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SelectBox(
          listItens: [
            'Lâmpada queimada',
            'Estrutura compormetida',
            'Cabos rompidos'
          ],
          selectedValue: selectedValue,
        ),
      ],
    );
  }
}
