import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/consts.dart';

enum Ambiente{
local;

  Future inicializar() async {

    await carregarAssetAmbiente();


    if (Get.isRegistered<Ambiente>()) {
      Get.replace<Ambiente>(this);
    } else {
      Get.put<Ambiente>(this, permanent: true);
    }
  }

  Future carregarAssetAmbiente({bool paraTestes = false}) async {
    try {
      if (paraTestes) {
        await dotenv.load(fileName: 'PathNaoExiste');
      }

      switch (this) {
        case Ambiente.local:
          await dotenv.load(fileName: assetsAmbienteLocal);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}