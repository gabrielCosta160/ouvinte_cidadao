import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/services/auth_services.dart';
import 'package:ouvinte_cidadao/ui/cadastro_solicitacoes/ctrl_cadastro_solicitacao.dart';
import 'package:ouvinte_cidadao/ui/cadastro_solicitacoes/page_cadastro_solicitacao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_home.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_voltar.dart';
import 'package:provider/provider.dart';

class PageSolicitacoes extends StatefulWidget {
  const PageSolicitacoes({super.key});

  @override
  State<PageSolicitacoes> createState() => PageSolicitacoesState();
}

class PageSolicitacoesState extends State<PageSolicitacoes> {
  CtrlCadastroSolicitacao controller = CtrlCadastroSolicitacao();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog(context) ?? false;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(context.width, 80),
            child: Container(
              color: corBotao,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications_outlined),
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.real_estate_agent_outlined,
                          size: 24,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Ouvinte cidadão',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: corBackgroundLight,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: context.width,
                      child: Image.asset(
                        'assets/imagens/logo.png',
                        fit: BoxFit.cover,
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
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Contato',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            children: listaBotoesContato(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Versão - 0.0.1',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                      textAlign: TextAlign.center),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> _showExitConfirmationDialog(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Deseja fazer logout ou sair do app?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Sair do app
              },
              child: Text('Sair'),
            ),
            TextButton(
              onPressed: () {
              auth.logout();
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
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

  List<Widget> listaBotoesContato() {
    List<Widget> botoes = [];
    botoes.add(botaoContatosUteis());

    return botoes;
  }

  Widget botaoContatosUteis() {
    return BotaoHome('Contatos Úteis', Icons.phone_enabled_outlined, () {});
  }

  Widget botaoMinhasSolicitacoes() {
    return BotaoHome('Histórico', Icons.content_paste_search_outlined, () {
      Get.toNamed(Rotas.pageCadastroSolicitacao);
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
