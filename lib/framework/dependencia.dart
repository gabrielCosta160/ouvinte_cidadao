import 'package:get/get.dart';

class Dependencia {
  static adicionarOuSubstituir<S>(S dependency) {
    if (Get.isRegistered<S>()) {
      Get.replace<S>(dependency);
    } else {
      Get.put<S>(dependency, permanent: true);
    }
  }

  static S obter<S>({String? tag}) => Get.find<S>();

  static bool estaRegistrado<S>() => Get.isRegistered<S>();

  static Future<bool> deletar<S>({String? tag, bool force = false}) async =>
      Get.delete<S>(tag: tag, force: force);
}
