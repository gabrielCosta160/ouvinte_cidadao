import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/textos.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/ui/solicitante/page_soliciatoes_efetuadas/row/page_row_solic_efetuadas.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';

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
      appBar: AppBar(
        backgroundColor: verde,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(context.width, 50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                  color: branco,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: 'Pesquise por tipo, código ou data da solicitação...',
                  hintStyle: context.textTheme.bodySmall,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'Histórico',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge!.copyWith(color: branco),
        ),
        iconTheme: IconThemeData(color: branco),
      ),
      backgroundColor: Colors.white70,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Botao(
                  cor: Colors.grey,
                  titulo: voltar,
                  onClick: () {
                    Navigator.of(context).pop();
                  }),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Center(child: PageRowSolicitacoesEfetuadas()),
      ),
    );
  }
}
