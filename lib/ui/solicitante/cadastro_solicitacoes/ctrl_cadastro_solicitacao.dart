import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';
import 'package:ouvinte_cidadao/infra/textos.dart';
import 'package:ouvinte_cidadao/ui/gestor/page_home/page_home.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/page_etxs/page_view_1.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/page_etxs/page_view_2.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/page_etxs/page_view_3.dart';
import 'package:ouvinte_cidadao/ui/solicitante/home/page_home.dart';

class CtrlCadastroSolicitacao {
  final TextEditingController textController = TextEditingController();
  PageController pageViewController =
      PageController(); // Inicialize diretamente
  var isExibirLabelObrigatorio = false.obs;
  var pageViewControllerLoaded = false.obs;
  var paginaAtual = 0.obs; // Alterado para RxInt
  String? motivoSelecionado;
  File? imagem;
  double? latitude;
  double? longitude;

  List<String> motivosIluminacao = [
    "Cabos rompidos",
    "Lâmpada queimada",
    "Problema estrutural",
    "Outro"
  ];
  List<String> motivosCapina = ["Terreno", "Árvores"];
  List<String> motivosLimpeza = ["Entulhos", "Limpeza de terreno"];
  List<String> motivosEstradas = ["Buracos na via", "Bueiro entupido"];
  List<String> motivosOutros = ["Outros"];
  TextEditingController tecOutro = TextEditingController();

  List<Widget> listaPages = [
    PageCadSolicitacao1(
      listaMotivos: [],
    ),
    PageCadSolicitacao2(),
    PageCadSolicitacao3()
  ];

  var atualizador = 1.obs;
  var selecionadoIndex = Rx<int?>(null);

  var progressValue = 0.2.obs;

  CtrlCadastroSolicitacao() {
    pageViewController = PageController(
      initialPage: 0,
    );
    pageViewControllerLoaded.value = true;
  }

  Future<void> irPara() async {
    pageViewController.nextPage(
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    paginaAtual.value += 1;
  }

  void voltarParaPageAnterior(BuildContext context) {
    if (paginaAtual == 0) {
      Rotas.ir(context, PageSolicitacoes());
      return;
    }
    if (pageViewController.hasClients) {
      pageViewController.previousPage(
          duration: const Duration(milliseconds: 100), curve: Curves.linear);
      if (pageViewController.page != null && pageViewController.page! > 0) {
        paginaAtual.value -= 1;
      }
    }
  }
}
