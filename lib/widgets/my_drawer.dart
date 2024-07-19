import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ouvinte_cidadao/infra/theme.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [cabecalho(), corpo()],
        ),
      ),
    );
  }

  Widget cabecalho() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(gradient: LinearGradient(colors:[ verde, roxo])),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundColor: Colors.deepOrange,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Usuario',
              style: context.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: branco),
            ),
            Text(
              'usuario@gmail.com',
              style: context.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold, color: branco),
            )
          ],
        ),
      ),
    );
  }

  Widget corpo() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Wrap(
            runSpacing: 16,
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: Text('Perfil'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title: Text('Notificações'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: Text('Contatos úteis'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: Text('Configurações'),
                onTap: () {},
              ),
              Divider(
                color: Colors.black54,
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: Text('Ajuda e Suporte'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: Text('Sobre o App'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app_outlined),
                title: Text('Sair'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
