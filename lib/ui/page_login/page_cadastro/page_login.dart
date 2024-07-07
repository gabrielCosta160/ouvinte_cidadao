import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/services/auth_services.dart';
import 'package:ouvinte_cidadao/ui/novas_solicitacoes/page_novas_solicitacoes.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/ui/page_login/page_cadastro/page_cadastro.dart';
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
  late PageController controllerPageView;
  late AuthService auth;

  @override
  void initState() {
    controllerPageView = PageController();
    auth = AuthService();
    super.initState();
  }

  void goToCadastroPage() {
    // Navigate to the page using Navigator
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => pageCadastroDados()),
    );
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
              child: Container(
                height: MediaQuery.of(context).size.height -
                    200, // Set a bounded height
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controllerPageView,
                  children: [
                    pageLogin(),
                    pageCadastroDados(),
                    pageCadastroEmail(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else
      return PageSolicitacoes();
  }

  Widget pageLogin() {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Bem vindo!',
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
                      titulo: 'Entrar',
                      onClick: (context) async {
                        await auth.login(
                            controller.tecEmail.text, controller.tecSenha.text);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: BotaoLink(
                        titulo: 'Não tenho conta',
                        onClick: () {
                          goToCadastroPage();
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pageCadastroEmail() {
    return SafeArea(
        child: Scaffold(
      backgroundColor: corBackgroundLight,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Dados',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: TextFormField(
                  controller: controller.tecEmail,
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
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
                    titulo: 'Cadastrar',
                    onClick: (context) async {
                      try {
                        await auth.registrar(
                            controller.tecEmail.text, controller.tecSenha.text);

                        await auth.login(
                            controller.tecEmail.text, controller.tecSenha.text);

                        Rotas.ir(context, PageSolicitacoes());
                      } catch (e) {}
                    }),
              ),
            ],
          ),
        ),
      )),
    ));
  }

  Widget pageCadastroDados() {
    return SafeArea(
      child: Scaffold(
        backgroundColor: corBackgroundLight,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Dados',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextFormField(
                      controller: controller.tecNome,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Nome'),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nome completo';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextFormField(
                      controller: controller.tecCPF,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'CPF'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe seu cpf';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextFormField(
                      controller: controller.tecEndereco,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Endereço'),
                      keyboardType: TextInputType.streetAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe o endereço completo';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: TextFormField(
                      controller: controller.tecTelefone,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Telefone'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Informe seu telefone';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: BotaoBottomApp(
                        titulo: 'Próximo',
                        onClick: (context) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => pageCadastroEmail()),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
