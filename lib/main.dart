import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';
import 'package:ouvinte_cidadao/ui/home/page_home.dart';
import 'package:ouvinte_cidadao/ui/novas_solicitacoes/page_novas_solicitacoes.dart';
import 'package:ouvinte_cidadao/ui/page_soliciatoes_efetuadas/page_solicitacoes_efetuadas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Rotas.pageLogin,
      getPages: Rotas.obterPages(),
    );
  }
}
