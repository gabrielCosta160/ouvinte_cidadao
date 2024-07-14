import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/utils.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';

Future showMyDialogCarregamento({
  required BuildContext context,
}) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialogCarregamento();
      });
}

class MyDialogCarregamento extends StatelessWidget {
  MyDialogCarregamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 350,
        height: 250,
        padding: const EdgeInsets.all(6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Carregando...',
                style: context.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Carregando(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Carregando extends StatelessWidget {
  const Carregando({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: verde,
          ),
        );
      },
    );
  }
}
