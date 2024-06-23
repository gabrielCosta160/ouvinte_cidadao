import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';

class BotaoHome extends StatelessWidget {
  final String titulo;
  final IconData icone;
  final VoidCallback onClick;

  BotaoHome(this.titulo, this.icone, this.onClick);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClick,
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icone, size: 24, color: Color(0xff747474)),
          Text(
            titulo,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff747474),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
