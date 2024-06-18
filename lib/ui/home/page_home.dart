// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:ouvinte_cidadao/infra/theme.dart';
// import 'package:ouvinte_cidadao/widgets/botao_voltar.dart';
//
// class PageHome extends StatefulWidget {
//   const PageHome({super.key});
//
//   @override
//   State<PageHome> createState() => PageHomeState();
// }
//
// class PageHomeState extends State<PageHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: corBackgroundLight,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Image.asset(
//                   'assets/imagens/logo.png',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 150),
//                 child: listaBotoes(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget listaBotoes() {
//     return Column(
//       children: [
//         Container(
//           height: 42,
//           width: 300,
//           child: Botao(
//             titulo: 'Nova solicitação',
//             icone: Icons.paste_outlined,
//             onClick: () {
//               Get.toNamed('/PageSolicitacoes');
//             },
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Container(
//           height: 42,
//           width: 300,
//           child: Botao(
//             titulo: 'Solicitações efetuadas',
//             icone: Icons.content_paste_search_outlined,
//             onClick: () {
//               Get.toNamed('/PageSolicitacoesEfetuadas');
//             },
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Container(
//           height: 42,
//           width: 300,
//           child: Botao(
//             titulo: 'Configurações',
//             icone: Icons.settings,
//             onClick: () {},
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class MyBindings extends Bindings {
//   @override
//   void dependencies() {}
// }
