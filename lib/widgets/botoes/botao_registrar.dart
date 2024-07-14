import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infra/theme.dart';

class BotaoRegistrar extends StatelessWidget {
  final String titulo;
  final Function(BuildContext) onClick;
  final Color? cor;
  final IconData? icone;
  EdgeInsetsGeometry? padding;
  bool? disable;

  BotaoRegistrar({
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
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black54,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.white), // Borda branca
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconeBotao(),
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
        style: context.textTheme.titleSmall!.copyWith(color: Colors.white), // Texto branco
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget iconeBotao() {
    return icone != null
        ? Icon(
      icone,
      color: Colors.white,
    )
        : SizedBox(
      height: 0,
    );
  }
}
