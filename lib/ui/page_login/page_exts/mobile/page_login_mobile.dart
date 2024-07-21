import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/exceptions.dart';
import 'package:ouvinte_cidadao/infra/formatacao.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';
import 'package:ouvinte_cidadao/infra/utils.dart';
import 'package:ouvinte_cidadao/ui/page_login/ctrl_page_login.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_link.dart';
import 'package:ouvinte_cidadao/widgets/botoes/botao_registrar.dart';
import 'package:ouvinte_cidadao/widgets/bottomSheet.dart';
import 'package:ouvinte_cidadao/widgets/campo_email_login.dart';
import 'package:ouvinte_cidadao/widgets/campo_senha_login.dart';
import 'package:ouvinte_cidadao/widgets/campo_texto.dart';

class PageLoginMobile extends StatefulWidget {
  const PageLoginMobile({super.key});

  @override
  State<PageLoginMobile> createState() => _PageLoginMobileState();
}

class _PageLoginMobileState extends State<PageLoginMobile> {
  late CtrlPageLogin controller;

  @override
  void initState() {
    controller = CtrlPageLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: context.height,
          width: context.width,
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: [verde, roxo])),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Bem vindo!',
                      style: context.textTheme.displaySmall!
                          .copyWith(fontWeight: FontWeight.bold, color: branco),
                    ),
                    Text(
                      'Faça login para continuar',
                      style: TextStyle(color: branco),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Botao(
                      titulo: 'Entrar',
                      onClick: () async {
                        await showMyBottomSheet(
                          context: context,
                          corpo: SizedBox(
                            height: context.height * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Entrar'),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child:
                                          CampoEmailLogin(controller.tecEmail),
                                    ),
                                    CampoSenha(
                                      controller.tecSenha,
                                      exibirEsqueciSenha: true,
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Botao(
                                        titulo: 'Entrar',
                                        onClick: () async {
                                          await controller.entrar(context);
                                        }),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    BotaoLink(
                                        textAlign: TextAlign.center,
                                        titulo: 'Voltar',
                                        onClick: () {
                                          Navigator.of(context).pop();
                                          controller.tecEmail.clear();
                                          controller.tecSenha.clear();
                                        }),
                                  ],
                                ),
                                BotaoLink(
                                    titulo: 'Não tenho conta',
                                    onClick: () async {
                                      Navigator.of(context).pop();
                                      await abrirAbaCadastro();
                                    })
                              ],
                            ),
                          ),
                          maxWidth: context.width,
                        );
                      },
                    ),
                    BotaoRegistrar(
                      titulo: 'Registrar',
                      onClick: (s) async {
                        await abrirAbaCadastro();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future abrirAbaCadastro() async {
    return await showMyBottomSheet(
      titulo: 'Preencha seus dados',
      context: context,
      corpo: SizedBox(
        height: context.height * 0.8,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CampoTexto(
                    titulo: 'Nome',
                    'Digite seu nome',
                    controller.tecNome,
                    onChanged: (value) {
                      controller.exibirCampoSenha.value = true;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CampoTexto(
                    inputFormatters: [CpfInputFormatter()],
                    titulo: 'CPF',
                    'Digite seu CPF',
                    controller.tecCPF,
                    onChanged: (value) {
                      validarCPF(value);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CampoTexto(
                    textInputType: TextInputType.phone,
                    titulo: 'Telefone',
                    'Digite seu telefone',
                    controller.tecTelefone,
                    onChanged: (s) async {
                      await controller.definirTelefone();
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CampoTexto(
                    titulo: 'Endereço',
                    'Digite seu endereço',
                    controller.tecEndereco,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CampoEmailLogin(controller.tecEmail),
                  const SizedBox(
                    height: 16,
                  ),
                  CampoSenha(controller.tecSenha),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Column(
                children: [
                  Botao(
                      titulo: 'Cadastrar',
                      onClick: () async {
                        try {
                          if (controller.isTodosCamposPreenchidos() == false) {
                            throw EPreenchaTodosOsCampos(
                                telefone: controller.tecTelefone.text,
                                senha: controller.tecSenha.text,
                                cpf: controller.tecCPF.text,
                                nome: controller.tecNome.text,
                                endereco: controller.tecEndereco.text,
                                email: controller.tecEmail.text);
                          }
                          if (validarCPF(controller.tecCPF.text) == false) {
                            throw ECpfInvalido();
                          }

                          await controller.cadastrar();
                        } catch (e) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(e.toString()),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Entendi'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }),
                  SizedBox(
                    height: 8,
                  ),
                  BotaoLink(
                      textAlign: TextAlign.center,
                      titulo: 'Voltar',
                      onClick: () async {
                        await controller.cancelarCadastro(context);
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
      maxWidth: context.width,
    );
  }
}
