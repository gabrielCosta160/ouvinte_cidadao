import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';

class BotaoRemoverFoto extends StatelessWidget {
  Function onClick;

  BotaoRemoverFoto(this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
      decoration: BoxDecoration(
        color: verde.withOpacity(0.2),
        border: Border.all(color: verde),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(Icons.delete_forever_outlined),
        color: verde,
        onPressed: () {
          onClick();
        },
      ),
    );
  }
}
