import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mysql1/mysql1.dart';
import 'package:ouvinte_cidadao/core/ambiente/ambiente.dart';
import 'package:ouvinte_cidadao/infra/rotas.dart';
import 'package:ouvinte_cidadao/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthService())],
      child: const MyApp(),
    ));
  } catch (e) {
    Exception(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
