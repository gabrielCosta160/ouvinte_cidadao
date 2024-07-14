import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infra/theme.dart';

class Botao extends StatelessWidget {
  final String titulo;
  final Function(BuildContext) onClick;
  final Color? cor;
  final IconData? icone;
  EdgeInsetsGeometry? padding;
  bool? disable;

  Botao({
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
            color: cor ?? verde,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
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
    return Container(
      child: Expanded(
        child: Text(
          titulo,
          style: context.textTheme.titleSmall!.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
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
