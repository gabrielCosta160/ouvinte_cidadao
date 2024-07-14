import 'package:flutter/services.dart';

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    if (text.isEmpty) {
      return newValue;
    }

    String newText = text.replaceAll(RegExp(r'\D'), '');

    if (newText.length > 11) {
      newText = newText.substring(0, 11);
    }

    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      if (i == 3 || i == 6) {
        buffer.write('.');
      } else if (i == 9) {
        buffer.write('-');
      }
      buffer.write(newText[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

extension FormatacaoString on String{


  String get somenteDecimais => replaceAll(RegExp("[^0-9,.-]"), "");

  String get somenteNumeros => replaceAll(RegExp("[^0-9]"), "");

  String toNumeroTelefone() {
    String textoSomenteNumeros = somenteNumeros;

    if (textoSomenteNumeros.length > 13) {
      textoSomenteNumeros = textoSomenteNumeros.substring(
          textoSomenteNumeros.length - 13, textoSomenteNumeros.length);
    }

    if (textoSomenteNumeros.length == 13) {
      return "+${textoSomenteNumeros.substring(0, 2)}(${textoSomenteNumeros.substring(2, 4)})${textoSomenteNumeros.substring(4, 9)}-${textoSomenteNumeros.substring(9)}";
    }
    if (textoSomenteNumeros.length == 12) {
      return "(${textoSomenteNumeros.substring(0, 3)})${textoSomenteNumeros.substring(3, 8)}-${textoSomenteNumeros.substring(8)}";
    }
    if (textoSomenteNumeros.length == 11) {
      return "(${textoSomenteNumeros.substring(0, 2)})${textoSomenteNumeros.substring(2, 7)}-${textoSomenteNumeros.substring(7)}";
    }
    if (textoSomenteNumeros.length == 10) {
      return "(${textoSomenteNumeros.substring(0, 2)})${textoSomenteNumeros.substring(2, 6)}-${textoSomenteNumeros.substring(6)}";
    }

    if (textoSomenteNumeros.length == 9) {
      return "${textoSomenteNumeros.substring(0, 5)}-${textoSomenteNumeros.substring(5)}";
    }
    if (textoSomenteNumeros.length == 8) {
      return "${textoSomenteNumeros.substring(0, 4)}-${textoSomenteNumeros.substring(4)}";
    }

    return textoSomenteNumeros;
  }
}
