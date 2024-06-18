import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ouvinte_cidadao/ui/page_soliciatoes_efetuadas/row/page_row_solic_efetuadas.dart';
import 'package:ouvinte_cidadao/widgets/botao_voltar.dart';

class PageSolicitacoesEfetuadas extends StatefulWidget {
  const PageSolicitacoesEfetuadas({super.key});

  @override
  State<PageSolicitacoesEfetuadas> createState() =>
      PageSolicitacoesEfetuadasState();
}

class PageSolicitacoesEfetuadasState extends State<PageSolicitacoesEfetuadas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 42,
              child: BotaoBottomApp(
                  cor: Colors.grey,
                  titulo: 'Voltar',
                  onClick: (context) {
                    Navigator.of(context).pop();
                  }),
            )
          ],
        ),
      ),
      body: Center(
        child: PageRowSolicitacoesEfetuadas()
      ),
    );
  }
}
