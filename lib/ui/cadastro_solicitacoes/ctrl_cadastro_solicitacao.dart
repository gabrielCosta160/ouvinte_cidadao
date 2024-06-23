import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ouvinte_cidadao/infra/textos.dart';

class CtrlCadastroSolicitacao{


  final TextEditingController textController = TextEditingController();

  String? motivoSelecionado;
  File? imagem;
  double? latitude;
  double? longitude;


List<String> motivosIluminacao = ["Cabos rompidos", "Lâmpada queimada", "Problema estrutural"];
List<String> motivosCapina = ["Terreno", "Árvores"];
List<String> motivosLimpeza = ["Entulhos", "Limpeza de terreno"];
List<String> motivosEstradas = ["Buracos na via", "Bueiro entupido"];
List<String> motivosOutros = ["Outros"];
}