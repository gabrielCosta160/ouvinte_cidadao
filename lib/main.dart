import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:ouvinte_cidadao/core/ambiente/ambiente.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'infra/theme.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(

  const MyApp(),
    );
  } catch (e) {
    Exception(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      initialRoute: Rotas.pageNovasSolicitacoes,
      getPages: Rotas.obterPages(),
    );
  }
}
