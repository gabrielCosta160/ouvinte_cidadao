import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ouvinte_cidadao/widgets/card_listagem.dart';

class PageRowSolicitacoesEfetuadas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Expanded(
        child: Column(
          children: [
            Container(
              height: 140,
              child: CardListagem(
                  isCardStatus: true,
                  color: Colors.orange,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '74125863 - Troca de lâmpada',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Av. Rio pardo, Nº 916 - Centro, Imbé/RS'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Solicitação em andamento'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Previsão de conclusão: 11/06/2024')
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
