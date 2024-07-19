import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infra/theme.dart';

class BotaoSecondario extends StatelessWidget {
  final String titulo;
  final Function(BuildContext) onClick;
  final Color? cor;
  final IconData? icone;
  EdgeInsetsGeometry? padding;
  bool? disable;

  BotaoSecondario({
    required this.titulo,
    required this.onClick,
    this.padding,
    this.icone,
    this.disable = false,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.all(8.0),
          child: MaterialButton(
            height: 50,
            onPressed: disable! ? null : () async {
              onClick(context);
            },
            color: Colors.transparent,
            elevation: 0,
            highlightElevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.green),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                tituloBotao(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget tituloBotao(BuildContext context) {
    return Expanded(
      child: Text(
        titulo,
        style: context.textTheme.titleSmall!.copyWith(color: Colors.green),
        textAlign: TextAlign.center,
      ),
    );
  }
}
