import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/platform/platform.dart';

bool isVisualizacaoMobile() {
  double width = Get.width;

  if (width < 1000) {
    return true;
  }

  if (GetPlatform.isMobile) {
    return true;
  }

  return false;
}
bool validarCPF(String cpf) {
  cpf = cpf.replaceAll(RegExp(r'\D'), '');

  if (cpf.length != 11) return false;
  if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) return false;

  List<int> numbers = cpf.split('').map((d) => int.parse(d)).toList();
  int sum1 = 0, sum2 = 0;

  for (int i = 0; i < 9; i++) {
    sum1 += numbers[i] * (10 - i);
    sum2 += numbers[i] * (11 - i);
  }

  int check1 = 11 - (sum1 % 11);
  if (check1 == 10 || check1 == 11) check1 = 0;
  if (check1 != numbers[9]) return false;

  sum2 += check1 * 2;
  int check2 = 11 - (sum2 % 11);
  if (check2 == 10 || check2 == 11) check2 = 0;
  if (check2 != numbers[10]) return false;

  return true;
}
