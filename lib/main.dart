
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/firebase_options.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';
import 'package:ouvinte_cidadao/services/auth_services.dart';
import 'package:ouvinte_cidadao/ui/home/page_home.dart';
import 'package:ouvinte_cidadao/ui/novas_solicitacoes/page_novas_solicitacoes.dart';
import 'package:ouvinte_cidadao/ui/page_soliciatoes_efetuadas/page_solicitacoes_efetuadas.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService())
    ],
    child: MyApp(),
  ));
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
