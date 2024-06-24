import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/services/auth_services.dart';
import 'package:ouvinte_cidadao/ui/novas_solicitacoes/page_novas_solicitacoes.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_voltar.dart';
import 'package:provider/provider.dart';

class PageLogin extends StatefulWidget {
  PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => PageLoginState();
}

class PageLoginState extends State<PageLogin> {
  CtrlPageLogin controller = CtrlPageLogin();
  final formKey = GlobalKey<FormState>();
  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Bem vindo';
        actionButton = 'Entrar';
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao login.';
      }
    });
  }

  login() async {
    try {
      await context
          .read<AuthService>()
          .login(controller.tecEmail.text, controller.tecSenha.text);
    } on AuthExeption catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  cadastrar() async{
    try {
      await context
          .read<AuthService>()
          .registrar(controller.tecEmail.text, controller.tecSenha.text);
    } on AuthExeption catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: corBackgroundLight,
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.only(top: 100),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.5),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: controller.tecEmail,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o email corretamente';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: controller.tecSenha,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Senha'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe sua senha';
                      } else if (value.length < 6) {
                        return 'Sua senha deve conter 6 digitos';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: BotaoBottomApp(
                      titulo: actionButton,
                      onClick: (context) {
                        if (formKey.currentState!.validate()) {
                          if (isLogin) {
                            login();
                          } else {
                            cadastrar();
                          }
                        }
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: BotaoLink(
                        titulo: toggleButton,
                        onClick: () => setFormAction(!isLogin)),
                  ),
                )
              ],
            ),
          ),
        )),
      ));
    } else
      return PageSolicitacoes();
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
