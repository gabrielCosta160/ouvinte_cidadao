import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/ctrl_cadastro_solicitacao.dart';
import 'package:ouvinte_cidadao/ui/solicitante/cadastro_solicitacoes/page_cadastro_solicitacao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_home.dart';
import 'package:ouvinte_cidadao/widgets/my_drawer.dart';

class PageSolicitacoes extends StatefulWidget {
  const PageSolicitacoes({super.key});

  @override
  State<PageSolicitacoes> createState() => PageSolicitacoesState();
}

class PageSolicitacoesState extends State<PageSolicitacoes> {
  CtrlCadastroSolicitacao controller = CtrlCadastroSolicitacao();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: branco),
          backgroundColor: Colors.transparent,
          // Define o fundo como transparente para mostrar o gradiente
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [verde, roxo],
              ),
            ),
          ),
        ),
        drawer: MyDrawer(),
        backgroundColor: corBackgroundLight,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Column(
          children: [
          Container(
          height: context.height * 0.3,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [verde, roxo])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(child: Image.asset(
                'assets/imagens/logo.png',
                fit: BoxFit.cover,),
              ),
            )
            )],
                      ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Novas Solicitações',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                physics: NeverScrollableScrollPhysics(),
                children: listaBotoesNovaSolicitacao(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Minhas solicitações',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: listaBotoesMinhasSolicitacoes(),
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
        ],
      ),
      ],
    ),)
    ,
    )
    ,
    );
  }

  List<Widget> listaBotoesNovaSolicitacao() {
    List<Widget> botoes = [];
    botoes.add(botaoTrocaLampada());
    botoes.add(botaoCapina());
    botoes.add(botaoBuraco());
    botoes.add(botaoLimpeza());
    botoes.add(botaoOutros());

    return botoes;
  }

  List<Widget> listaBotoesMinhasSolicitacoes() {
    List<Widget> botoes = [];
    botoes.add(botaoMinhasSolicitacoes());

    return botoes;
  }

  Widget botaoMinhasSolicitacoes() {
    return BotaoHome('Histórico', Icons.content_paste_search_outlined, () {
      Get.toNamed(Rotas.pageSolicitacoesEfetuadas);
    });
  }

  Widget botaoTrocaLampada() {
    return BotaoHome('Iluminação', Icons.lightbulb, () {
      Rotas.ir(context,
          PageCadastroSoliticacao(controller.motivosIluminacao, 'Iluminação'));
    });
  }

  Widget botaoCapina() {
    return BotaoHome('Jardinagem', Icons.grass_outlined, () {
      Rotas.ir(context,
          PageCadastroSoliticacao(controller.motivosCapina, 'Jardinagem'));
    });
  }

  Widget botaoBuraco() {
    return BotaoHome('Estradas', Icons.remove_road, () {
      Rotas.ir(context,
          PageCadastroSoliticacao(controller.motivosEstradas, 'Estradas'));
    });
  }

  Widget botaoLimpeza() {
    return BotaoHome('Limpeza', Icons.recycling_outlined, () {
      Rotas.ir(context,
          PageCadastroSoliticacao(controller.motivosLimpeza, 'Limpeza'));
    });
  }

  Widget botaoOutros() {
    return BotaoHome('Outros', Icons.receipt, () {
      Rotas.ir(
          context, PageCadastroSoliticacao(controller.motivosOutros, 'Outros'));
    });
  }
}
